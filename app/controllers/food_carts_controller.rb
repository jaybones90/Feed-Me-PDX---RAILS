class FoodCartsController < ApplicationController

  def index
    @food_carts = FoodCart.all
  end

  def show
    @food_cart = FoodCart.find(params[:id])
  end

end
