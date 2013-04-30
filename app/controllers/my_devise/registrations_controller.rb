class MyDevise::RegistrationsController < Devise::RegistrationsController

  #  after_filter :finish_ab_test, :only => [:create]

  def create
    super
    fname = (params[:user][:full_name]).split.first
    lname = (params[:user][:full_name]).split.last
    lname = '' if (params[:user][:full_name]).split.length == 1
    email = params[:user][:email]
    begin
      Rails.logger.warn "** Subscribe registered #{email} to mailchimp, status #{MailChimpMailer.subscribe("Your home search savings leader",email,fname,lname)}"
    rescue Exception => e
      Rails.logger.error "** Could not subscribe user to mailchimp upon registration please reregister"
      flash.now[:error] = " *** Could not subscribe user to newsletter. Please try to reregister"
      render action: "new" and return
    end    
  end

end
