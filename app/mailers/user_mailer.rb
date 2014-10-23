class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def registration_confirmation(user)
    @user = user
    mail(to: user.email, subject: "Registered")
  end

  def application_confirmation(user, course)
    @user = user
    @course = course
    mail(to: user.email, subject: "Application submitted")
  end
end
