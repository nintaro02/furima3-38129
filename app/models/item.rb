class Item < ApplicationRecord
  
  validates :product, presence: true
  validates :description, presence: true
  validates :user, presence: true
  
  with_options numericality: { other_than: 1, message: "can't be blank" } do
  validates :status_id, presence: true 
  validates :postage_id, presence: true 
  validates :shipping_day_id, presence: true
  validates :prefecture_id, presence: true 
  validates :category_id, presence: true
  validates :price, presence: true,numericality: { with: /\A[0-9]+\z/ }
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  has_one_attached :user
  belongs_to :user

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :prefecture
belongs_to :shipping_day
belongs_to :postage
belongs_to :status
belongs_to :category
end