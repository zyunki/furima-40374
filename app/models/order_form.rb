# app/forms/order_form.rb
class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id

  # バリデーションの定義
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d+\z/, message: "must be numeric and half-width" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "must be numeric, half-width and either 10 or 11 digits long" }
    # エラーメッセージ：数値であり、半角で10桁または11桁でなければならない
  end

  def save
    # 購入情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)

    # 配送先情報を保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end
