class UserMailer < ApplicationMailer
  def new_message(user, dog)
    @user = user
    @dog = dog

    mail(to: @user.email, subject: "Vous avez reçu un nouveau message")
  end
end
