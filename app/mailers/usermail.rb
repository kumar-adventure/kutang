class Usermail < ActionMailer::Base
  default from: "info@kutangaza.com"

  def welcome_email(user)
    @user = user
    @url = 'http://kutangaza.com/login'
    mail(to: @user.email, subject: 'Kutangaza: Registration confirmation')
  end

  def send_email(email, sender, sender_name, sender_phone, message)
    @email = email
    @sender = sender
    @name = sender_name
    @phone = sender_phone
    @message = message
    mail(to: email, subject: "Customer mail from Kutangaza.")
  end

  def password_link(user)
    @user = user
    @url = "http://0.0.0.0:3000/password_resets/#{user.token}/edit"
    mail(:to => user.email, :subject => "Kutangaza - Password link.")
  end

end
