class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :postage
  belongs_to :status
  belongs_to :category

  validates :product,presence:true
  validates :description,presence:true
  validates :image, presence:true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  
  with_options numericality: { other_than: 0, message: "can't be blank" } do
  validates :status_id 
  validates :postage_id 
  validates :shipping_day_id
  validates :prefecture_id 
  validates :category_id
  end
end

 