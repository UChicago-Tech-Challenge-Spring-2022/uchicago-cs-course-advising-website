class HomeController < ApplicationController

  def index
    render({ :template => "home.html.erb" })
  end
  
  end