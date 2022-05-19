class NotificationController < ApplicationController
  require 'selenium'
  require 'selenium-webdriver'
  
  def launchBrowser()
    user_input = nil
    until(user_input == 1)
      $driver = Selenium::WebDriver.for :chrome
  
      $driver.get('https://coursesearch92.ais.uchicago.edu/psc/prd92guest/EMPLOYEE/HRMS/c/UC_STUDENT_RECORDS_FL.UC_CLASS_SEARCH_FL.GBL?')
  
      #search = $driver.find_element(:id, "UC_CLSRCH_WRK2_PTUN_KEYWORD").attribute('placeholder')
      search = $driver.find_element(:id, "UC_CLSRCH_WRK2_PTUN_KEYWORD")
  
      $driver.execute_script('arguments[0].value = arguments[1]', search, 'CMSC 15400')
  
      $driver.find_element(:id, "UC_CLSRCH_WRK_SSR_PB_SEARCH$IMG").click()
      
      puts "Please enter a 1 to close popup."
      user_input = gets.chomp.to_i
    end
  end
  launchBrowser()
  
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