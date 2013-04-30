
class UserMailer < ActionMailer::Base
  default from: ENV['FEEWISE_USERNAME']

  # customer signup confirmation
  def welcome_email(user)
    @user = user
    @url  = "https://www.feewise.com/sign_in"
    mail(:to => user.email, :bcc => ENV['FEEWISE_SEND_LEADPLACE_NEW_CUSTOMER'], :subject => subject_environment_helper("Welcome to FeeWise"))
  end

  # customer_registration_confirmation
  def customer_registration_confirmation(user)
    @user = user
    @url  = "https://www.feewise.com/users/sign_in"
    mail(:to => user.email, :bcc => ENV['FEEWISE_SEND_LEADPLACE_NEW_CUSTOMER'], :subject => subject_environment_helper("FeeWise Customer Registration Confirmation"))
  end

  #
  def feewise_preferences_change_notification(user)
    @user = user
    @url  = "https://www.feewise.com/users/sign_in"
    mail(:to => ENV['FEEWISE_SEND_LEADPLACE_NEW_CUSTOMER'], :subject => subject_environment_helper("Notice FeeWise Customer has changed preferences"))
  end

  def presales_customer_enquiry(email)
    @email = email
    @url  = "https://www.feewise.com/admin"
    mail(:to => ENV['FEEWISE_SEND_LEADPLACE_NEW_CUSTOMER'], :subject => subject_environment_helper("A potential customer just asked to be signed up or emailed us a question.  Check the admin console for info "))
  end

  def subject_environment_helper(subject)
    Rails.env.production? ? subject : "Just testing (#{ENV['RAILS_ENV'].upcase}) environment: #{subject}"
  end

end
