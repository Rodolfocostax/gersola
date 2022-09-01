class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to users_path
    end
  end
end
