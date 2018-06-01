class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :updateadmin]
  
 
  def new
     
    @user = User.new
    
  end
   def create
    @user = User.new(user_params)
     if @user.save
       redirect_to user_path(@user.id)
       ContactMailer.send_mail(@user).deliver
     else
      render 'new'
     end
   end
    def contact_us
    end
    def about_us
    end
   
   def show
   end
   def edit
   end
   def makeadmin
     @users=User.all
     
   end
   def updateadmin
     
     if @user.admin == 1
       adminvalue =0
     else
       adminvalue = 1
     end
     if  User.where(id:@user.id).update_all(admin: adminvalue)
      
          redirect_to makeadmin_path, notice: "admin permision successfully granted！"
      else
       redirect_to makeadmin_path, notice: "error something is wrong！"
     end
    
   end
   def update
     
    if @user.update(user_params)
      redirect_to user_path, notice: "You have edited your profile！"
    else
      render 'edit'
    end
   end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:address,
                                 :password_confirmation,:address,:image)
  end
   def set_user
      @user = User.find(params[:id])
   end
end
