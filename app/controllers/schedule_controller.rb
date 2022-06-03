class ScheduleController < ApplicationController

  skip_before_action :verify_authenticity_token
  def index
    if user_signed_in?
      render({ :template => "schedule.html.erb" })
    else
      redirect_to "/", alert: "In order to use the Schedule, you have to sign in first"
    end
  end

  
  def search

    course_number = params.fetch(:courseNum)
    @result = Course.find_by(course_number: course_number)

    if @result != nil
      respond_to do |format|
        format.html { redirect_to "schedule" }
        format.json { head :no_content }
        format.js {render template: "schedule.js.erb"}
      end
    else
      redirect_back fallback_location: "/", alert: "No Course Info Found."
    end


  end

  def save

    plans = Plan.where({ :user_id => current_user.id }).first
    plans.class1a1 = params.fetch("1a1")
    plans.class1a2 = params.fetch("1a2")
    plans.class1a3 = params.fetch("1a3")
    plans.class1a4 = params.fetch("1a4")
    plans.class1a5 = params.fetch("1a5")
    plans.class1w1 = params.fetch("1w1")
    plans.class1w2 = params.fetch("1w2")
    plans.class1w3 = params.fetch("1w3")
    plans.class1w4 = params.fetch("1w4")
    plans.class1w5 = params.fetch("1w5")
    plans.class1s1 = params.fetch("1s1")
    plans.class1s2 = params.fetch("1s2")
    plans.class1s3 = params.fetch("1s3")
    plans.class1s4 = params.fetch("1s4")
    plans.class1s5 = params.fetch("1s5")
    plans.class1su1 = params.fetch("1su1")
    plans.class1su2 = params.fetch("1su2")
    plans.class1su3 = params.fetch("1su3")
    plans.class1su4 = params.fetch("1su4")
    plans.class1su5 = params.fetch("1su5")


    plans.class2a1 = params.fetch("2a1")
    plans.class2a2 = params.fetch("2a2")
    plans.class2a3 = params.fetch("2a3")
    plans.class2a4 = params.fetch("2a4")
    plans.class2a5 = params.fetch("2a5")
    plans.class2w1 = params.fetch("2w1")
    plans.class2w2 = params.fetch("2w2")
    plans.class2w3 = params.fetch("2w3")
    plans.class2w4 = params.fetch("2w4")
    plans.class2w5 = params.fetch("2w5")
    plans.class2s1 = params.fetch("2s1")
    plans.class2s2 = params.fetch("2s2")
    plans.class2s3 = params.fetch("2s3")
    plans.class2s4 = params.fetch("2s4")
    plans.class2s5 = params.fetch("2s5")
    plans.class2su1 = params.fetch("2su1")
    plans.class2su2 = params.fetch("2su2")
    plans.class2su3 = params.fetch("2su3")
    plans.class2su4 = params.fetch("2su4")
    plans.class2su5 = params.fetch("2su5")
    
    plans.class3a1 = params.fetch("3a1")
    plans.class3a2 = params.fetch("3a2")
    plans.class3a3 = params.fetch("3a3")
    plans.class3a4 = params.fetch("3a4")
    plans.class3a5 = params.fetch("3a5")
    plans.class3w1 = params.fetch("3w1")
    plans.class3w2 = params.fetch("3w2")
    plans.class3w3 = params.fetch("3w3")
    plans.class3w4 = params.fetch("3w4")
    plans.class3w5 = params.fetch("3w5")
    plans.class3s1 = params.fetch("3s1")
    plans.class3s2 = params.fetch("3s2")
    plans.class3s3 = params.fetch("3s3")
    plans.class3s4 = params.fetch("3s4")
    plans.class3s5 = params.fetch("3s5")
    plans.class3su1 = params.fetch("3su1")
    plans.class3su2 = params.fetch("3su2")
    plans.class3su3 = params.fetch("3su3")
    plans.class3su4 = params.fetch("3su4")
    plans.class3su5 = params.fetch("3su5")

    
    plans.class4a1 = params.fetch("4a1")
    plans.class4a2 = params.fetch("4a2")
    plans.class4a3 = params.fetch("4a3")
    plans.class4a4 = params.fetch("4a4")
    plans.class4a5 = params.fetch("4a5")
    plans.class4w1 = params.fetch("4w1")
    plans.class4w2 = params.fetch("4w2")
    plans.class4w3 = params.fetch("4w3")
    plans.class4w4 = params.fetch("4w4")
    plans.class4w5 = params.fetch("4w5")
    plans.class4s1 = params.fetch("4s1")
    plans.class4s2 = params.fetch("4s2")
    plans.class4s3 = params.fetch("4s3")
    plans.class4s4 = params.fetch("4s4")
    plans.class4s5 = params.fetch("4s5")


    plans.save
    

  end
  

end