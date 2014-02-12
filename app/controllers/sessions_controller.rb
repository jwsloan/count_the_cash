class SessionsController < ApplicationController
  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      
    else
      @error_message = "Username/password error."
      render 'new'
    end
  end
end
