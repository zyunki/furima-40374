class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order(created_at: :asc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to root_path, notice: '商品が出品されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :product_description, :product_condition_id, :category_id,
                                 :shipping_cost_id, :shipping_day_id, :prefecture_id, :user_id, :price, :image)
  end
end
