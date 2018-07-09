class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    byebug
    if user_params[:is_seller] == "true"
      @class_user = Seller.create(params.require(:seller).permit(:name, :address, :postcode))
    else
      @class_user = Buyer.create(params.require(:buyer).permit(:name))
    end

    @user.class_id = @class_user.id
    redirect_to @class_user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :is_seller)
  end
end
