class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :check_administrative_ip

  ADMINISTRATIVE_IPS =
      ["192.168.74.",
       "10.1.78.",
       "10.128.1.",
       "10.2.15.",
       "192.168.56.",
       "10.0.75.",
       "127.0.0.1."]

  def check_administrative_ip
    redirect_to new_clock_url unless ADMINISTRATIVE_IPS.include? request.remote_ip
    return false
  end


end
