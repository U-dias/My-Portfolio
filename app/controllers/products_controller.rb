class ProductsController < ApplicationController
  before_action :require_login

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    current_user.views.create(product: @product)
  end
end
