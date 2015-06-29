class UserMailer < ApplicationMailer
  default from: "notifacations@example.com"

  def book_accepting user, request_book 
    @user = user
    @request_book = request_book
    mail to: @user.email, subject: t("emails.acceptbook")
  end
end
