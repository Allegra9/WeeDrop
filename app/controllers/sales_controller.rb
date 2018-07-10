class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @cart_items = []
    cart.each do |item|
      @cart_items << [Product.find(item[0]), item[1]]
    end
  end

  def create
    @sale = Sale.create()
    
  end


  private

  def sale_params
    params.require(:sale).permit(:buyer_id, :status, :total)
  end

end
