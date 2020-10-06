class NotificationMailMailer < ApplicationMailer
  default from: "JustSending@gmail.com"
  
  def notify_mail(user)
    @user = user
    mail(to: @user.email, subject: "FINISH")
  end
end
