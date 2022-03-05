class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    member = Member.find_by(params[:session][:id])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to member
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def logout
    log_out
    redirect_to login_url
  end
end
