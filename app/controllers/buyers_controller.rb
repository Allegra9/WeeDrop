class BuyersController < ApplicationController
  skip_before_action :require_log_in, only: :new

  def new
    @buyer = Buyer.new
  end

  def show
    @buyer = Buyer.find(params[:id])
    @cart_items = {}
    cart.each do |item_id, quant|
      @cart_items[Product.find(item_id)] = quant
    end
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def update
    @buyer = Buyer.update(buyer_params(:billing_address, :billing_postcode, :delivery_address, :delivery_postcode))
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

end
