class RegistrationsController < ApplicationController
  skip_before_filter :login_required
  skip_before_filter :set_return_to
  
  def new
    session[:return_to] = request.env['HTTP_REFERER'] if request.env['HTTP_REFERER'] =~ /[\/forum|\/wiki]/
    redirect_to "#{FUSESOURCE_URL}/register?return_to=#{session[:return_to]}"
  end
end