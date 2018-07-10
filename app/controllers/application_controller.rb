class ApplicationController < ActionController::Base
  helper_method :cart, :cart_total, :empty_cart
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
    session[:cart] ||= {}
  end

  def cart_total
    cart_items = {}
    cart.each do |item_id, quant|
      cart_items[Product.find(item_id)] = quant
    end
    total = 0
    cart_items.each do |i, q|
      total += (i.price.to_i * q.to_f)
    end
    total
  end

  def empty_cart
    session.delete :cart
  end
end
