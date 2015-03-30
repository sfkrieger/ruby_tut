class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    #i think this is the thing that deals with the cookie/session management...
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      remember(user)
      redirect_back_or user

    else
      # what is this thing?? like it gets saved in the sessions controller
      # but how do you descriminate between @flash and flash (@user and user... and what is accessible where -
      # in what class and in what modules(?) )
      flash.now[:danger] = 'Invalid username/password combo'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
