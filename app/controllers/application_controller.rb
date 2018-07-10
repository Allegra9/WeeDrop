class ApplicationController < ActionController::Base
  helper_method :cart, :cart_total
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

  def cart_total
    cart_items = []
    cart.each do |item|
      cart_items << [Product.find(item[0]), item[1]]
    end
    total = 0
    cart_items.each do |i_q|
      total += (i_q[0].price * i_q[1].to_i)
    end
    total
  end
end
