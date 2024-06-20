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

  with_options presence: true do
    validates :product_name
    validates :price
    validates :product_description
    validates :product_condition_id
    validates :category_id
    validates :shipping_cost_id
    validates :shipping_days_id
    validates :prefecture_id
    validates :user_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :prefecture_id
    validates :product_condition_id
    validates :shipping_cost_id
    validates :shipping_days_id
  end
end