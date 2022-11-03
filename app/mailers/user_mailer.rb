class UserMailer < ApplicationMailer
  default from: 'admin@bookstore.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/users/sign_in'
    attachments.inline['welcome.jpg'] = File.read('public/welcome.jpg')
    mail(to: email_address_with_name(@user.email, @user.name), subject: 'Welcome to BoOkStoRE!')
  end
end
