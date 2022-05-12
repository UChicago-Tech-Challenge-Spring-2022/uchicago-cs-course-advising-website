class LoginController < ApplicationController

  def login
    render({ :template => "login.html.erb" })
  end
  
  end