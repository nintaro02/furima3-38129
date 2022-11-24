FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { '1' }
    city { '市町村' }
    address { '1-1' }
    phone_number { '09012345678' }
    token { 'test' }
    building_name { '' }
    user_id { '2' }
    item_id { '2' }
  end
end
