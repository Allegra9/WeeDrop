class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_log_in, only: :new

  def new
    @buyer = Buyer.new
  end

  def show
    auth_buyer_actions
    @cart_items = {}
    cart.each do |item_id, quant|
      @cart_items[Product.find(item_id)] = quant
    end
    @sales = Sale.where(buyer_id: current_user.class_id).sort_by { |sale| sale.created_at }.reverse
  end

  def edit
    auth_buyer_actions
  end

  def update
    @buyer.update(buyer_params(:billing_address, :billing_postcode, :delivery_address, :delivery_postcode))
    redirect_to buyer_path(@buyer)
  end

  def destroy
  end

  def discard
    empty_cart
    redirect_to buyer_path(params[:id])
  end

  private

  def buyer_params(*args)
    params.require(:buyer).permit(*args)
  end

  def set_buyer
    @buyer = Buyer.find(params[:id])
  end

  def auth_buyer_actions
    if current_user.is_seller || current_user.class_id != @buyer.id
      flash[:errors] = ["You can't see this page"]
      redirect_to sellers_path
    end
  end

end
