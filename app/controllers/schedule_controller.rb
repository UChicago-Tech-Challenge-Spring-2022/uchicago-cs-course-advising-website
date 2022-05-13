class ScheduleController < ApplicationController

  def schedule
    if user_signed_in?
      render({ :template => "schedule.html.erb" })
    else
      redirect_to "/", alert: "In order to use this feature, you have to sign in first"
    end
  end
  
end