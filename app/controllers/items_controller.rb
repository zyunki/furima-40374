class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.order("created_at DESC")

  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :price, :product_description, :product_condition_id, :category_id, :shipping_cost_id, :shipping_days_id, :prefecture_id, :user_id)
  end
  end

