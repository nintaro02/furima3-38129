class ItemsController < ApplicationController
def new
  @item = Item.new
end

def index
  @user = User.new
end
end