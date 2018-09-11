class AccountMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.new_message.subject
  #
  def new_message
    @email = params[:email]
    @account_urls = params[:account_urls]
    mail(to: @email, subject: 'QuikConnect')
  end
end
