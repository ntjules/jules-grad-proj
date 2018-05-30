class CoffeebinsController < ApplicationController
  before_action :logged_in_user
  # before_action :only_admin
  def index
  end
   def new
    @cofeebin = Coffeebin.new
     @user = User.all
   end
   def unpayed
     @cofeebin=Coffeebin.joins(:user)
                        .select("users.*,(coffeebins.quantity).sum As cquantity")
                        .group('users.id')
    
   end
   
   def create
     @price = Price.last
         @cofeebin = Coffeebin.new(coff_params)
       @cofeebin.amount = @price.price * params[:coffeebin][:quantity].to_f
     if @cofeebin.save
       
    #   redirect_to blogs_path, notice: "You have created new blog!"
    # BlogMailer.blog_mail(current_user.email,@blog).deliver
     redirect_to new_coffeebin_path, notice: "successfuly inserted!"
      else
      # render 'new'
       render 'new'
  
     end
    
   
   end
   
   
   
    private
  def coff_params
    params.require(:coffeebin).permit(:quantity, :payed, :user_id)
  end
end
