class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number, format: {with: /\d{10,11}/}
    validates :building_name
    validates :user_id
    validates :item_id
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  end
    

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city,
       address: address, building_name: building_name, phone_number: phone_number, order: order)
  end
end

  
