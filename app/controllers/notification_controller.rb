class NotificationController < ApplicationController

  def index
    if user_signed_in?
      render({ :template => "notify.html.erb" })
    else
      redirect_to "/", alert: "In order to use the Notifier, you have to sign in first"
    end
  end

  def create_monitor

  end
end