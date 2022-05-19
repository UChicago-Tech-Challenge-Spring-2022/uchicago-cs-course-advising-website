class NotificationController < ApplicationController
  require 'selenium'
  require 'selenium-webdriver'
  
  def launchBrowser()
    user_input = nil
    until(user_input == 1)
      $driver = Selenium::WebDriver.for :chrome
  
      $driver.get('https://coursesearch92.ais.uchicago.edu/psc/prd92guest/EMPLOYEE/HRMS/c/UC_STUDENT_RECORDS_FL.UC_CLASS_SEARCH_FL.GBL?')
  
      search = $driver.find_element(:id, "UC_CLSRCH_WRK2_PTUN_KEYWORD").send_keys("SOSC 15300")
  
      $driver.find_element(:id, "UC_CLSRCH_WRK_SSR_PB_SEARCH$IMG").click()
    
    def wait_until_appears(type, name, timeout: 5)
	  		wait = Selenium::WebDriver::Wait.new(timeout: timeout)
	  		#wait.until { $driver.find_element(:xpath, "//span[@id='UC_RSLT_NAV_WRK_PTPG_ROWS_GRID']").attribute("innerText") != "" }
	  		wait.until { $driver.find_element(:xpath, "//td[@class='ps_grid-cell']").clickable? }
		end

			
		num_sections = $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")
		puts "the number of available sections is:" 
		puts num_sections 

		availibility = $driver.find_element(:id, "UC_CLSRCH_WRK_DESCR1$0").attribute("innerText")
		puts "the first section has this many ppl: "
		puts availibility
  
      #$driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText") != " " 
  
      
      #Watir::Wait.until { $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText") }
  
      #num_sections = $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText").wait_until_present
  
      #puts num_sections
      #until $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText").exists?
  
      #num_sections = $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")
      #	puts "the number of available sections is:"
      #	puts num_sections
      #finding number of sections for course
      #num_sections = $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")
      #num_sections = $driver.find_element(:xpath, "//span[@id='UC_RSLT_NAV_WRK_PTPG_ROWS_GRID']").text
      #puts "the number of available sections is:"
      #puts num_sections
  
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