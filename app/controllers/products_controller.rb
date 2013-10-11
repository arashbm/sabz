class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource except: [:create]

  def index
    @products = @products.where.not(state: 'deleted')
    respond_with(@products)
  end

  def mine
    @products = Product.where(provider: current_user) 
  end

  def show
    respond_with(@product)
  end

  def new
    @product = current_user.products.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.soft_destroy
    respond_with(@product)
  end

  def recycle
    @product.recycle
    respond_with(@product)
  end

  private

  def product_params
    if current_user.admin?
      params.require(:product).permit(:name, :sku, :manufacturer, :quantity, :discription, :url, :state)
    else
      params.require(:product).permit(:name, :sku, :manufacturer, :quantity, :discription, :url)
    end
  end
end
