class ManualController < ApplicationController

  def index
    render({ :template => "manual.html.erb" })
  end
  
  end