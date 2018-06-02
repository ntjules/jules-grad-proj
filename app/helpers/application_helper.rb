module ApplicationHelper
  def get_price
   @price = Price.last
  @current_Price =@price.price
    
  end
end
