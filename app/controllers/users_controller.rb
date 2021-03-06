class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end


  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Bienvenido a EventGo"
      redirect_to listEvent_url
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
