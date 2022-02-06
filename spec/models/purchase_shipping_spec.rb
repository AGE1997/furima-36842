require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '購入商品情報の保存' do
    context '購入商品情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入商品情報が保存できない場合' do
      it 'zip_codeが空だと保存できない' do
        @purchase_shipping.zip_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが3桁ハイフン4桁の半角文字列で正しい形式でないと保存できない' do
        @purchase_shipping.zip_code = 1234567
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'zip_codeが半角文字列出ないとと保存できない' do
        @purchase_shipping.zip_code = '１２３-４５６７'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'prefectureが空では保存できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipal_districtが空では保存できない' do
        @purchase_shipping.municipal_district = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Municipal district can't be blank")
      end
      it 'addressが空では保存出来ない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では保存できない' do
        @purchase_shipping.telephone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁未満だと保存できない' do
        @purchase_shipping.telephone_number = 123456789
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number is invalid. 電話番号は10桁 or 11桁")
      end
      it 'telephone_numberが11桁以上だと保存できない' do
        @purchase_shipping.telephone_number = 123456789012
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number is invalid. 電話番号は10桁 or 11桁")
      end
      it 'telephone_numberが半角数値でないと保存できない' do
        @purchase_shipping.telephone_number = '１２３４５６７８９０'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Telephone number is invalid. 電話番号は10桁 or 11桁")
      end
      it 'userが紐づいていないと保存できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('User must exist')
      end
      it 'itemが紐づいていないと保存できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Item must exist')
      end
      it 'tokenが空では保存できない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
