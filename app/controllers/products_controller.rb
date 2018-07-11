class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :add]

  def index
    @products = Product.where(seller_id: params[:seller_id])
    @seller = Seller.find(params[:seller_id])
  end

  def new
    auth_seller_actions
    @product = Product.new
    @seller = Seller.find(params[:seller_id])
  end

  def create
    @product = Product.create(product_params)
    if @product.valid?
      redirect_to seller_product_path(@product.seller, @product)
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to new_seller_product_path
    end
  end

  def show
    @seller = Seller.find(params[:seller_id])
  end

  def edit
    auth_seller_actions
    @seller = Seller.find(params[:seller_id])
  end

  def update
    @product.update(product_params)

    if @product.valid?
      redirect_to seller_products_path(@product.seller)
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to edit_product_path(@product)
    end
  end

  def destroy
    @product.destroy
    redirect_to seller_products_path(params[:seller_id])
  end

  def add
    if cart == {} || @product.seller == cart_seller
      cart[@product.id] = params[:quantity]
    else
      flash[:errors] = ["To buy products from a different shop, please empty your cart first"]
    end

    redirect_to seller_products_path(Seller.find(params[:seller_id]))
  end

  def remove
    cart.delete(params[:id])
    if cart.length < 1
      empty_cart
    end
    redirect_to buyer_path(params[:buyer_id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :img_url, :seller_id)
  end

  def auth_seller_actions
    if !current_user.is_seller || current_user.class_id != @seller.id
      flash[:errors] = ["You can't see this page"]
      redirect_to sellers_path
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
