class ScheduleController < ApplicationController

  def index
    if user_signed_in?
      render({ :template => "schedule.html.erb" })
    else
      redirect_to "/", alert: "In order to use the Schedule, you have to sign in first"
    end
  end
  
end