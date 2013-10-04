class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    @products = Product.all
    @product = @products.find(params[:id])
    respond_with(@product)
  end

  def new
    @product = current_user.products.new
    respond_with(@product)
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def create
    @product = current_user.products.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product = current_user.products.find(params[:id])
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    respond_with(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :sku, :manufacturer, :quantity, :discription, :url)
  end
end
