class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:email])
  end

  def new
    @user = User.new
    render :show_form
  end

  def edit
    @user = User.find_by(:email => params[:email])
    render :show_form
  end

  def create
    @user = User.create(user_params)
    validate_user
  end

  private

    def user_params 
      params.require(:user)
        .permit(:name, :email, :password, :password_confirmation)
    end
    
    def validate_user
      if @user.valid?
        @users = User.all
        @user.save
        #render :hide_form
        redirect_to new_session_path
      else 
        puts @user.errors.full_messages
        render :show_form
      end
    end
end
