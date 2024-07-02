class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path, notice: '購入が完了しました'
    else
      render :index, status: :unprocessable_entity
    end
  end
end

private

def  order_params
  params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_unmber, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
end

def set_item
  @item = Item.find(params[:item_id])
end