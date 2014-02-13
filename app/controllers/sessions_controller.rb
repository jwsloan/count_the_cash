# @author John Sloan
# This is adapted from http://ruby.railstutorial.org
class SessionsController < ApplicationController
  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      render :hide_form
    else
      # The view will use this to display the error.
      @error_message = "Username or Password invalid."
      render :new
    end
  end

  def destroy
    sign_out
    render :hide_form
  end
end
