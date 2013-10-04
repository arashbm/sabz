class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @requests = Request.all
    respond_with(@requests)
  end

  def show
    @request = Request.find(params[:id])
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
    @request = current_user.requests.find(params[:id])
    @request.update(request_params)
    respond_with(@request)
  end

  def destroy
    @request = current_user.requests.find(params[:id])
    @request.destroy
    respond_with(@request)
  end

  private

  def request_params
    params.require(:request).permit(:name, :sku, :manufacturer, :quantity, :discription, :url)
  end
end
