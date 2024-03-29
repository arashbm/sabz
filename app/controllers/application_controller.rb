require "application_responder"

class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?

  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    [:first_name, :last_name, :institute, :phone, :fax, :address].each do |i|
      devise_parameter_sanitizer.for(:sign_up) << i
      devise_parameter_sanitizer.for(:account_update) << i
    end
  end
end
