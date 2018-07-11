class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_log_in, only: :new

  def index
    @sellers = Seller.all
  end

  def new
    @seller = Seller.new
  end

  def show

    @seller = Seller.find(params[:id])
  end

  def edit
  end

  def update
    @seller.update(seller_params)

    if @seller.valid?
      redirect_to @seller
    else
      flash[:errors] = @seller.errors.full_messages
      redirect_to edit_seller_path(@seller)
    end
  end

  def destroy
    @seller.destroy
    redirect_to sellers_path
  end

  private
  def seller_params
    params.require(:seller).permit(:name, :address, :postcode)
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end
end
