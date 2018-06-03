class CoffeebinsController < ApplicationController
  before_action :logged_in_user
  # before_action :only_admin
  def index
  end
   def new
    @cofeebin = Coffeebin.new
     @user = User.all
    
   end
      def payed

                           
     @payedusers=Coffeebin.joins(:user)
                        .select("users.*,(coffeebins.quantity).sum As cquantity,(coffeebins.amount).sum As camount")
                        .where(:payed => "true")
                        .group('users.id')
                        .order('camount desc')
     @totalpayed= Coffeebin.select("(coffeebins.quantity).sum AS qty, (coffeebins.amount).sum AS amt")
                        .where(:payed => "true")
                        respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'coffeebins/payedrpt',pdf:'report' , header: { right: '[page] of [topage]' , encoding:'UTF-8' }}
     end
      end
   def unpayed
     
                           
     @unpayedusers=Coffeebin.joins(:user)
                        .select("users.*,(coffeebins.quantity).sum As cquantity,(coffeebins.amount).sum As camount")
                        .where(:payed => "false")
                        .group('users.id')
                        .order('camount desc')
     @totalunpayed= Coffeebin.select("(coffeebins.quantity).sum AS qty, (coffeebins.amount).sum AS amt")
                        .where(:payed => "false")
      
  respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'coffeebins/unpayedrpt',pdf:'report' , header: { right: '[page] of [topage]' , encoding:'UTF-8' }}
     end
    
    
   end
   def unpayedforuser
     
                          
       @cofeebinpayed_foruser= User.find(current_user.id).coffeebins
                          .where(payed: false)
                          .order('created_at desc')
                          
       @totalpayed_foruser= Coffeebin.select("(coffeebins.quantity).sum AS qty, (coffeebins.amount).sum AS amt")
                        .where(:user_id =>current_user.id, :payed => "false")
                        
                        
                        respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'coffeebins/unpayedrptuser',pdf:'report' , header: { right: '[page] of [topage]' , encoding:'UTF-8' }}
     end
   end
   def payedforuser
                   
       @cofeebinpayed_foruser= User.find(current_user.id).coffeebins
                          .where(payed: true)
                          .order('created_at desc')
                          
       @totalpayed_foruser= Coffeebin.select("(coffeebins.quantity).sum AS qty, (coffeebins.amount).sum AS amt")
                        .where(:user_id =>current_user.id, :payed => "true")
                                           respond_to do |format|
      format.html
      format.json
      format.pdf {render template:'coffeebins/payedrptuser',pdf:'report' , header: { right: '[page] of [topage]' , encoding:'UTF-8' }}
     end
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
