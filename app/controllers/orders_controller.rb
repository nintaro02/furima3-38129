class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :set_order_address, only: [:index, :new]
  before_action :move_to_index, only: :index

  def index
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address,
                                          :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order_address
    @order_address = OrderAddress.new
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif !@item.order.nil?
      redirect_to root_path
    end
  end
end
