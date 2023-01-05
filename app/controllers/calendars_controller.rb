class CalendarsController < ApplicationController
  before_action :set_record, only: %i[edit update destroy]
  def index  
    start_date = params.fetch(:start_date, Date.today).to_date
    @calendars = Calendar.where(user_id: current_user.id, record_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def create
    @calendar = current_user.calendars.build(calendar_params)
    if @calendar.save
      redirect_to calendars_path, success: '日付の登録に成功しました!'
    else
      redirect_to calendars_path,  danger: '日付の登録に失敗しました'
    end
  end
  
  def edit; end
  
  def update
    if @calendar.update(calendar_params)
      redirect_to calendars_path, success: '日付を更新しました'
    else
      flash.now[:danger] = '日付の更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @calendar.destroy
    redirect_to calendars_path, success: '日付を削除しました'
  end


  def show
    @calendar = User.find(params[:user_d])
  end

  private

  def set_record
    @calendar = current_user.calendars.find(params[:id])  
  end

  def calendar_params
    params.require(:calendar).permit(:date_type, :record_date, :start_date)
  end
end
