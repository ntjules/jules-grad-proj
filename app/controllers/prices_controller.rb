class PricesController < ApplicationController
   before_action :logged_in_user
  # before_action :only_admin
  
   def new
    @price = Price.new
     
    
    
   end
   
   def create
     
         @price = Price.new(price_params)
      
     if @price.save
   
     redirect_to new_price_path, notice: "success! Price setted!"
      else
        render 'new'
  
     end
    
   
   end
   
   
   
    private
  def price_params
    params.require(:price).permit(:price)
  end
end