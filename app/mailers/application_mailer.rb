class ApplicationMailer < ActionMailer::Base
  default from: 'uchicago.course.notification@gmail.com'
  layout 'mailer'
end

# this file is where we put method that creates mailer object