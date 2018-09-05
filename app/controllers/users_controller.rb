class UsersController < ApplicationController
  def create
    @account = Account.new()
  end


  def text
    p params
    number = params.fetch("email_message").fetch("mail_message")
    message = params.fetch("message")
    p [number, message]
    client = Twilio::REST::Client.new
    options = {
      from: "#{User.email}"
      to: 'misspena21@gmail.com',
      body: message
    }
    p options
    p client.messages.create(options)
  end
  end
  