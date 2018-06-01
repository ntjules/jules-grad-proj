class ContactMailer < ApplicationMailer
  def send_mail(user)
  @email = user.email
  @name = user.name

 mail to: @email, subject: "confirmation new of account creation"
  end
end