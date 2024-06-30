class Order < ApplicationRecord
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # 数量が空では購入できない、数量が０より大きい数でないと購入できない
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  # 金額が空では購入できない、金額が０より大きい額でないと購入できない

  belongs_to :user
  belongs_to :item
end
