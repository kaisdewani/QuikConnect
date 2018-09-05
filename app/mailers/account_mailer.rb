class AccountMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.new_message.subject
  #
  def new_message(email,message)
    @email = email
    @email_message = message

    # @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
      
  end
end
