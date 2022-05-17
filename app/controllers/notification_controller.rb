class NotificationController < ApplicationController

  #added the following line for POST /notification error; Need to fix it later for security issue
  skip_before_action :verify_authenticity_token

  def index
    if user_signed_in?
      render({ :template => "notification.html.erb" })
    else
      redirect_to "/", alert: "In order to use the Notifier, you have to sign in first"
    end
  end

  #Need to modify create_monitor, right now does the same thing as index
  def create_monitor

    #store user inputs: course number and email. Maybe also add a layer of validation of numbers and emails?
    #"@" means globally accessible varaibles; available to all methods and corresponding rendered pages within the class
    #### Could also verify if emails and courseNumber are valid?
    @email = params.fetch("email")
    @courseNum = params.fetch("courseNumber")
    #courseNum, go to the public course search 



    #the following is the same as function index above
    if user_signed_in?
      render({ :template => "notification.html.erb" })
    else
      redirect_to "/", alert: "In order to use the Notifier, you have to sign in first"
    end
  end
end