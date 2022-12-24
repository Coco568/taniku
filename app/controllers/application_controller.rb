class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_autthenticated
    redirect_to login_path, alert: "先にログインしてください"
  end
end
