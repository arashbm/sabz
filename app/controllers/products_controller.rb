class ProductsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource except: [:create]

  def index
    @products = @products.where.not(state: 'deleted')
    unless params[:category].blank?
      @category = Category.find(params[:category])
      @products = @products.where(category_id: @category.self_and_descendants.pluck(:id))
    end
    respond_with(@products)
  end

  def mine
    @products = Product.where(provider: current_user) 
  end

  def queue
    raise 'not accessible' unless current_user.admin?
    @products = Product.where(state: 'pending')
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
    respond_with(@product, location: request.env["HTTP_REFERER"])
  end

  def recycle
    @product.recycle
    respond_with(@product, location: request.env["HTTP_REFERER"])
  end

  def approve
    @product.approve
    respond_with(@product, location: request.env["HTTP_REFERER"])
  end

  private

  def product_params
    if current_user.admin?
      params.require(:product).permit(:name, :category_id, :sku, :manufacturer, :quantity, :discription, :url, :state)
    else
      params.require(:product).permit(:name, :category_id, :sku, :manufacturer, :quantity, :discription, :url)
    end
  end
end
