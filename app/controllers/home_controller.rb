class HomeController < ApplicationController

  def index
    render({ :template => "welcome.html.erb" })
  end
  
  end