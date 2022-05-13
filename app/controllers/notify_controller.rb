class NotifyController < ApplicationController

  def notification
    if user_signed_in?
      render({ :template => "notify.html.erb" })
    else
      redirect_to "/", alert: "In order to use this feature, you have to sign in first"
    end
  end

end