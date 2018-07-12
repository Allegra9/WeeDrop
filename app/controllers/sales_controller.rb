class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @cart_items = {}
    cart.each do |item_id, quant|
      @cart_items[Product.find(item_id)] = quant
    end
    @seller = @cart_items.keys[0].seller
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def create
    @buyer= Buyer.find(current_user.class_id)
    @buyer.update(buyer_params)
    if @buyer.valid?
      @sale = Sale.create(sale_params)

      cart.each do |item, quant|
        product = Product.find(item)
        ProdSale.create(product_id: item, sale_id: @sale.id, quantity: quant, price: product.price)
      end
      empty_cart
      redirect_to sale_path(@sale)
    else
      flash[:errors] = @buyer.errors.full_messages
      redirect_to new_sale_path
    end
  end


  private

  def sale_params
    params.require(:sale).permit(:buyer_id, :status, :total, :seller_id)
  end

  def buyer_params
    params.require(:buyer).permit(:cardholder_name, :card_number, :card_expiry_month, :card_expiry_year, :cvv, :email_address, :billing_address, :billing_postcode, :delivery_address, :delivery_postcode)
  end


end
