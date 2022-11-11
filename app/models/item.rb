class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :postage
  belongs_to :status
  belongs_to :category
  
  validates :user, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, 
  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
  
  with_options numericality: { other_than: 0, message: "can't be blank" } do
  validates :status_id, presence: true 
  validates :postage_id, presence: true 
  validates :shipping_day_id, presence: true
  validates :prefecture_id, presence: true 
  validates :category_id, presence: true
  end
end

 