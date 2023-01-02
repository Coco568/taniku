class CalendarsController < ApplicationController
  def show
    @calendar = User.find(params[:id])

  end

  def calendar_params
    params.require(:calendar).pernit(:user_id)
  end
end
