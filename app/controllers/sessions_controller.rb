class SessionsController < ApplicationController
  skip_before_action :require_log_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    @user = user.try(:authenticate, params[:user][:password])

    unless @user
      return redirect_to(controller: 'sessions', action: 'new')
    end

    session[:user_id] = @user.id
    if @user.is_seller
      redirect_to controller: 'sellers', action: 'show', id: @user.class_id
    else
      redirect_to controller: 'sellers', action: 'index'
    end
  end

  def destroy
    byebug
    session.delete :user_id
    redirect_to '/'
  end


end
