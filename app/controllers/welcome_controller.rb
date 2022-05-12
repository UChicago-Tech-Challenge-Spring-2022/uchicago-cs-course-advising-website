class WelcomeController < ApplicationController

  def welcome
    render({ :template => "welcome.html.erb" })
  end
  
  end