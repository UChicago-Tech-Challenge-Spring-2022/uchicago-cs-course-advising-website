require 'mechanize'
require 'selenium'
require 'selenium-webdriver'
require 'mailgun-ruby'

@courseNum = "COURSE CODE" #ex. CMSC 15400
@email = "youremail@sender.com"
@key = "ENTER api-key HERE"
def launchBrowser(inputted_course_num)

	options = Selenium::WebDriver::Chrome::Options.new
	options.add_argument('--headless')
	$driver = Selenium::WebDriver.for :chrome, options: options

	$driver.get('https://coursesearch92.ais.uchicago.edu/psc/prd92guest/EMPLOYEE/HRMS/c/UC_STUDENT_RECORDS_FL.UC_CLASS_SEARCH_FL.GBL')

	search = $driver.find_element(:id, "UC_CLSRCH_WRK2_PTUN_KEYWORD").send_keys(inputted_course_num)

	$driver.find_element(:id, "UC_CLSRCH_WRK_SSR_PB_SEARCH$IMG").click()

	wait = Selenium::WebDriver::Wait.new(timeout: 10)
	wait.until { 
		($driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")).length > 4
	}

	num_sections_text = $driver.find_element(:id, "UC_RSLT_NAV_WRK_PTPG_ROWS_GRID").attribute("innerText")
	
	num_sections = (num_sections_text[/\d+/]).to_i
	
	section_status = Array.new(num_sections)

	j = 0
	until (j == num_sections)
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
		
		j += 1
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
		return 1

	else
		return 0
	end
end

def query_class_availibility(inputted_course_num)
	loop do
		section_status_arr = launchBrowser(inputted_course_num)

		if(avail_sec_exists(section_status_arr) == 1)
			send_email()
			puts "Email has been sent! Program has been terminated."
			break
		else 
			puts "No sections have availability. Continuing to query..."
			sleep 60
		end
	end
end

def send_email()
	mg_api_key = @key #please retrieve api key from the website
	mg_sending_domain = "mg.appdevproject.com"

	mg_client = Mailgun::Client.new(mg_api_key)

	email_parameters =  { 
	  :from => "uchicago.course.notification@gmail.com",
	  :to => @email,  
	  :subject => "Section availability for #{@courseNum}",
	  :text => "There is at least one available seat in #{@courseNum}!" 
	}
	mg_client.send_message(mg_sending_domain, email_parameters)
end

query_class_availibility(@courseNum)
