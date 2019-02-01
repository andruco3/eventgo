class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to listEvent_url
    else
      flash.now[:danger] = 'No coincide usuario y contraseña'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
