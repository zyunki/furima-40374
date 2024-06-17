class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :product_condition
  belongs_to :shipping_cost
  belongs_to :shipping_days

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
