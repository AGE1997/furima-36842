FactoryBot.define do
  factory :item do
    name                { 'うどん' }
    explanation         { '香川県のうどんです。' }
    category_id         { '11' }
    condition_id        { '2' }
    shipping_charges_id { '3' }
    prefecture_id       { '38' }
    days_id             { '2' }
    price               { '3500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima_test_code.png'), filename: 'furima_test_code.png')
    end
  end
end