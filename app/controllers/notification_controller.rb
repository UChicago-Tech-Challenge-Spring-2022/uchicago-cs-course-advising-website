class NotificationController < ApplicationController
  require 'selenium'
  require 'selenium-webdriver'
  
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
  
  def launchBrowser()
    $driver = Selenium::WebDriver.for :chrome

		$driver.get('https://coursesearch92.ais.uchicago.edu/psc/prd92guest/EMPLOYEE/HRMS/c/UC_STUDENT_RECORDS_FL.UC_CLASS_SEARCH_FL.GBL?')

		search = $driver.find_element(:id, "UC_CLSRCH_WRK2_PTUN_KEYWORD").send_keys("SOSC 15300")

		$driver.find_element(:id, "UC_CLSRCH_WRK_SSR_PB_SEARCH$IMG").click()
	
		wait = Selenium::WebDriver::Wait.new(timeout: 10)
		wait.until { 
			($driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")).length > 4
		}

		num_sections_text = $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")
		puts "num_sections_text: "
		puts num_sections_text 
		
		i = 0
		num_sections = ""
		until (num_sections_text[i].to_s == " ") do
			num_sections.concat(num_sections_text[i].to_s)
			i += 1
		end

		num_sections = num_sections.to_i
		
		section_avail = Array.new(num_sections)

		j = 0
		until (j == num_sections)
    		section_id = "UC_CLSRCH_WRK_DESCR1$" + j.to_s
    		#puts "j: " + j.to_s
    		#puts section_id
    		section_stats = $driver.find_element(:id, section_id).attribute("innerText")
    		#puts section_stats

    		k = 20
    		num_enr = ""
    		until (section_stats[k].to_s == "/") do 
    			num_enr.concat(section_stats[k].to_s)
  				k += 1
    		end

    		l = k + 1
    		num_total = ""
    		until (l == section_stats.length)
    			num_total.concat(section_stats[l].to_s)
    			l += 1
    		end

    		section_space = num_total.to_i - num_enr.to_i 

    		section_avail[j] = section_space
    		puts "Section " + (j + 1).to_s + " has " + section_avail[j].to_s + " available seat(s)."
    		
    		j += 1
		end
  end    
end

