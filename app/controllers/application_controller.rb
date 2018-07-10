class ApplicationController < ActionController::Base
  helper_method :cart
  before_action :current_user
  before_action :require_log_in

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def require_log_in
    return redirect_to controller: 'sessions', action: 'new' unless logged_in?
  end

  def cart
    session[:cart] ||= []
  end
end
