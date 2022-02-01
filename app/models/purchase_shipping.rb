class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :municipal_district, :address, :building_name, :telephone_number, :purchase_id, :user_id, :item_id

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipal_district
    validates :address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. 電話番号は10桁 or 11桁"}
    validates :purchase_id
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(zip_code: zip_code, prefecture_id: prefecture_id, municipal_district: municipal_district, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end