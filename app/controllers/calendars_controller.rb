class CalendarsController < ApplicationController
  def index  
    @calendars = Calendar.where(user_id: current_user.id)
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = current_user.calendars.build(calendar_params)
    if @calendar.save
      redirect_to calendars_path, success: '日付の登録に成功しました!'
    else
      redirect_to calendars_path, status: :unprocessable_entity
    end
  end

  def show
    @calendar = User.find(params[:user_d])
  end

  def calendar_params
    params.permit(:date_type, :record_date, :user_id)
  end
end
