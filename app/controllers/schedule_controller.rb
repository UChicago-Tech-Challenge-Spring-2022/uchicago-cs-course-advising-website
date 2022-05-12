class ScheduleController < ApplicationController

  def schedule
    render({ :template => "schedule.html.erb" })
  end
  
end