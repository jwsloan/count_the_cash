class SessionsController < ApplicationController
  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
#      redirect_to root_path
      render :hide_form      
    else
      @error_message = "Username/password error."
      render 'new'
    end
  end
end
