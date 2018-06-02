class ContactMailer < ApplicationMailer
  def send_mail(user)
  @email = user.email
  @name = user.name

 mail to: @email, subject: "confirmation new of account creation"
  end
  
    def send_mail2(user,emails)
     @email = user[:email]
     @message = user[:message]
      @name = user[:name]
     
   mail to: emails, subject: user[:subject],from: @email 
    end
   def thanks(user)
      @name = user[:name]
     
   mail to: user[:email], subject: "Thanks,we will reach you soon",from: "tumbacws" 
   end
  
end