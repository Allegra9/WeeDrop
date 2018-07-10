class BuyersController < ApplicationController
  skip_before_action :require_log_in, only: :new

  def new
    @buyer = Buyer.new
  end

  def show
    @buyer = Buyer.find(params[:id])
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def update
    @buyer = Buyer.update(buyer_params(:billing_address, :billing_postcode, :delivery_address, :delivery_postcode))
    redirect_to @buyer
  end

  def destroy

  end

  private

  def buyer_params(*args)
    params.require(:buyer).permit(*args)
  end

end
