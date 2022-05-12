class ManualController < ApplicationController

  def course_manual
    render({ :template => "course_manual.html.erb" })
  end
  
  end