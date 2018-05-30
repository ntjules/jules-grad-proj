class UsersController < ApplicationController
  def new
     if logged_in?
      redirect_to home_path
     end
    @user = User.new
    
  end
   def create
    @user = User.new(user_params)
     if @user.save
       redirect_to user_path(@user.id)
     else
      render 'new'
     end
   end
   
   def show
    @user = User.find(params[:id])
   end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:address,:image)
  end
end
