class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def authenticate

    @authenticated = (User.find_by(id: session[:user_id]) != nil) && ((session[:expire_on] ||= '9999-12-31') && session[:expire_on] >= Time.now)

    end 



end
