
class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      render :json => {success: 1, who: user.slug, message: "Logged in successfully"}
    else
      render :json => {success: 0, message: "Log in failed: email or password is incorrect"}
    end
  end

  def forget(user)
    user.forget
  end

  def destroy
    log_out
    render :json => {message: "You logged out."}
    # redirect_to root_url
  end

  private

  def user_params
    params.permit(:email, :password, :last_visit_time)
  end

end