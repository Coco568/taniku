class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :set_user, only: %i[show edit  update destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :gender, :prefecture, :icon, :icon_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
