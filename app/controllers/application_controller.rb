class ApplicationController < ActionController::Base
  protect_from_forgery

  Rails.env.production? do
    before_filter :check_url
  end

  def check_url
    redirect_to request.protocol + "www." + request.host_with_port + request.fullpath if !/^www/.match(request.host)
  end

  def after_sign_in_path_for(customer)
    account_path customer
  end

  def after_sign_out_path_for(resource_or_scope)
    Rails.logger.info('after_sign_out is added here')
    session[:feewise_inproc_buying] = nil # finish purchase => not in the process of buying any more
    session[:style] = nil # When debugging and changing or keeping constant style which is rotated by ab_testing this releases the variable kept constant over repeated calls
    super
  end

  def finish_ab_test
    # finished("landing")
    # session[:style] = nil # When debugging and changing or keeping constand style which is rotated by ab_testing this releases the variable kept constant over repeated calls
  end



end
