module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def current_price
    @price ||= Price.last
    @current_price =@price.price
    
  end
  def logged_in?
    !current_user.nil?
  end
  def logged_in_user
      unless logged_in?
         flash[:danger] = "Please log in."
        redirect_to new_session_path
      
         
      end
  
  
  end
  def isadmin?
    if logged_in?
      current_user.admin == 1
    else
      false
      
    end
  end
  
  def only_admin
    if !isadmin?
      flash[:error] = 'You must be admin to access that page.'
      # redirect_to :new_session

    end
  end
end
