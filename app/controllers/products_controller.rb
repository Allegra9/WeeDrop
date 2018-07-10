class ProductsController < ApplicationController

  def index
    @products = Product.where(seller_id: params[:seller_id])
    @seller = Seller.find(params[:seller_id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.valid?
      redirect_to @product
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to new_product_path
    end
  end

  def show
    @product = Product.find(params[:id])
    @seller = Seller.find(params[:seller_id])
    # @sellers = Seller.where(seller_id: params[:id])
    # gets all the prodcuts from a clicked seller
  end

  def edit
  end

  def update
    @product.update(product_params)

    if @product.valid?
      redirect_to @product
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to edit_product_path(@product)
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :img_url, :seller_id)
  end

end
