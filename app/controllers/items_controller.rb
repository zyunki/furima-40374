class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.all

  end

  def new
   
  end

  def create

  end


end
