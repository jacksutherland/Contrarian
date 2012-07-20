class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  def user_name
    @user_name ||= User.find_by_id!(session[:user_id]).name
  end

  helper_method :user_name

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to home_url, notice: "Please log in"
    end
  end

end
