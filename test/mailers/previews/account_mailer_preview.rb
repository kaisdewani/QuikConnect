# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/new_message
  def new_message
    message = "hello"
    AccountMailer.new_message(message)
  end

end
