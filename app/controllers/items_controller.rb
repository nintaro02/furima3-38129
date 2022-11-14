class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_item, only: [:edit, :update, :show]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if @item.user_id != current_user.id
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:product, :price, :description, :status_id, :postage_id, :shipping_day_id, :prefecture_id,
                                 :category_id, :image, :user).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
