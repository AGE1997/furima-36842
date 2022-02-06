FactoryBot.define do
  factory :purchase_shipping do
    zip_code { '123-4567' }
    prefecture_id { '38' }
    municipal_district { '東京都千代田区' }
    address { '青山1-1-1' }
    building_name { 'Googleタワー' }
    telephone_number { '07012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
