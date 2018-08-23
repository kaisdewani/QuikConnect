class TwilioController < ApplicationController
  

  def index
  account_sid = 'AC5e3c8587859bddd02c0d56bebc8be376'
  auth_token = 'ea8c5cb3966527dadcf13a1a4399d000'
  client = Twilio::REST::Client.new(account_sid, auth_token)
  
  @sms = client.messages
    .create(
       body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
       from: '17864850920',
       to: '9546828911'
     )
  
  end


end
