class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = ItemOrder.new
  end

  def new
    @item_order = ItemOrder.new
  end


  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:post_code, :prefecture, :city, :address,
       :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
