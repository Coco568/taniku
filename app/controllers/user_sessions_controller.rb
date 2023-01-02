class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to calendar_path(@user), success: 'ログインに成功しました!'
    else
      flash.now[:danger]="ログインできませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトに成功しました!'
  end
end
