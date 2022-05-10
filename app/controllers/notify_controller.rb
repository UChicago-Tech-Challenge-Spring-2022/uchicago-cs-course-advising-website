class NotifyController < ApplicationController

  def notification
    render({ :template => "notify.html.erb" })
  end
  
  end