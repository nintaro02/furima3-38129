FactoryBot.define do
  factory :item do
   product {'test'}
   price {'333'}
   description {'aaaaaaaaaaaaa'}
   status_id {'1'}
   postage_id {'1'}
   shipping_day_id {'1'}
   prefecture_id {'1'}
   category_id {'1'}
   association :user 
   after(:build) do |item|
    item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
  end
  end
end