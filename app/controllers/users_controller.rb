class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  before_action :correct_user?, only: [:edit, :update, :destroy]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render action: :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    sign_out
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
