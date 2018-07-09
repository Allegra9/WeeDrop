class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]

  def index
    @sellers = Seller.all
  end

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.create(seller_params(:username, :password))

    if @seller.valid?
      redirect_to @seller
    else
      flash[:errors] = @seller.errors.full_messages
      redirect_to new_seller_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @seller.update(seller_params(:address, :postcode))

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
    params.require(:seller).permit(:username, :password)
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end
end
