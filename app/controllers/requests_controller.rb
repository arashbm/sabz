class RequestsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource except: [:create]

  def index
    @requests = @requests.where.not(state: 'deleted')
    respond_with(@requests)
  end

  def mine
    @requests = Request.where(requester: current_user) 
  end

  def show
    respond_with(@request)
  end

  def new
    @request = current_user.requests.new
    respond_with(@request)
  end

  def edit
  end

  def create
    @request = current_user.requests.new(request_params)
    @request.save
    respond_with(@request)
  end

  def update
    @request.update(request_params)
    respond_with(@request)
  end

  def destroy
    @request.soft_destroy
    respond_with(@request)
  end

  def recycle
    @product.recycle
    respond_with(@product)
  end

  private

  def request_params
    if current_user.admin?
      params.require(:request).permit(:name, :sku, :manufacturer, :quantity, :discription, :url, :state)
    else
      params.require(:request).permit(:name, :sku, :manufacturer, :quantity, :discription, :url)
    end
  end
end
