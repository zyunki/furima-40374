class ShippingOrigin < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は半角数字で10桁または11桁で入力してください" }
  validates :order_id, presence: true

  belongs_to :user
  belongs_to :item
  belongs_to :order
end
