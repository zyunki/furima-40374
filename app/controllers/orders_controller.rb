class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    Order.create(order_params)
  end

end

private
def  order_params
  params.require(:order).permit(:item_id, :quantity, :total_price, :shipping_address_id)
end