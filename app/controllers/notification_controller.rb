class NotificationController < ApplicationController

  require 'mailgun-ruby'
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

    #### Could also verify if emails and courseNumber are valid?
    @email = params.fetch("email")
    @courseNum = params.fetch("courseNum")
    @key = ENV.fetch("mailgun_key")
    
    if user_signed_in?
      render template: "notification.html.erb", notice:"Monitor created successfully. Please keep this tab open. DO NOT CLOSE THIS TAB. An email will be sent to you shortly."
    else
      redirect_to "/", alert: "Error occurred, please try again."
    end

    query_class_availibility(@courseNum)
  end

  def launchBrowser(inputted_course_num)

    #launch the chrome driver in headless mode and search the given course number on the course search website
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')   
    options.add_argument("--disable-dev-shm-usage")
    $driver = Selenium::WebDriver.for :chrome, options: options
  
    $driver.get('https://coursesearch92.ais.uchicago.edu/psc/prd92guest/EMPLOYEE/HRMS/c/UC_STUDENT_RECORDS_FL.UC_CLASS_SEARCH_FL.GBL')
  
    search = $driver.find_element(:id, "UC_CLSRCH_WRK2_PTUN_KEYWORD").send_keys(inputted_course_num)
  
    $driver.find_element(:id, "UC_CLSRCH_WRK_SSR_PB_SEARCH$IMG").click()
  
    wait = Selenium::WebDriver::Wait.new(timeout: 20)
    wait.until { 
      ($driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")).length > 4
    }
  
    #send email to confirm that the monitor event will begin
    send_email("Your Monitoring Request for #{@courseNum}", "Monitor event has begun. You will receive a notification when the class #{@courseNum} is available.")


    num_sections_text = $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")
    
    num_sections = (num_sections_text[/\d+/]).to_i
    
    section_status = Array.new(num_sections)
  
    for j in 0...num_sections
      section_id = "UC_CLSRCH_WRK_DESCR1$" + j.to_s
      total_id = "UC_CLSRCH_WRK_DESCR2$" + j.to_s
  
      if (($driver.find_element(:id, total_id).attribute("innerText")).include? "Total Enrollment") == false
        section_status_text = $driver.find_element(:id, section_id).attribute("innerText")
        
        k = 20
      else
        section_status_text = $driver.find_element(:id, total_id).attribute("innerText")
        
        k = 18
      end
  
      num_enr = section_status_text[/\d+/]
      num_total = section_status_text.scan(/\d+/)[1]
      
      section_space = num_total.to_i - num_enr.to_i 
      section_status[j] = section_space
      puts "Section " + (j + 1).to_s + " has " + section_status[j].to_s + " available seat(s)."
      
    end
    return section_status
    
  end
  
  def avail_sec_exists(inputted_sec_array)
    i = 0
    counter = 0
  
    inputted_sec_array.each do |free_seats|
      counter = counter + free_seats
    end
  
    if (counter > 0)
      return true
  
    else
      return false
    end
  end
  

  def query_class_availibility(inputted_course_num)
    loop do
      #this needs changes because we don't necessarily need the entire launchBrowser code up until clicking the search bar
      section_status_arr = launchBrowser(inputted_course_num)
  
      #send the email when there is a seat available
      if(avail_sec_exists(section_status_arr))
        subject = "Section availability for #{@courseNum}"
        text = "There is at least one available seat in #{@courseNum}!" 
        send_email(subject, text)
        break
      #should add a feature that sends the email to confirm that the bot is still monitoring the user's desired course after certain period of time
      else 
        puts "No sections have availability. Continuing to query..."
        sleep 60
      end
    end
  end
  
  #send email with specified subject and text
  def send_email(subject, text)
    mg_api_key = @key
    mg_sending_domain = "mg.appdevproject.com"
  
    mg_client = Mailgun::Client.new(mg_api_key)
  
    email_parameters =  { 
      :from => "uchicago.course.notification@gmail.com",
      :to => @email,  
      :subject => subject,
      :text => text 
    }
    mg_client.send_message(mg_sending_domain, email_parameters)
  end
end
