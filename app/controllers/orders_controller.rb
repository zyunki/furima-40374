class OrdersController < ApplicationController
  def create
    Order.create(order_params)
  end
end

private
def  order_params
  params.require(:order).permit(:item_id, :quantity, :total_price, :shipping_address_id)
end