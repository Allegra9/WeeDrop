class UsersController < ApplicationController
  skip_before_action :require_log_in, only: :create

  def create
    @user = User.create(user_params)
    if user_params[:is_seller] == "true"
      @class_user = Seller.create(params.require(:seller).permit(:name, :address, :postcode))
    else
      @class_user = Buyer.create(params.require(:buyer).permit(:name))
    end
    @user.class_id = @class_user.id
    @user.save

    session[:user_id] = @user.id

    redirect_to @class_user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :is_seller)
  end
end
