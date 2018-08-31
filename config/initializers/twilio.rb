Twilio.configure do |config|
    config.account_sid = Rails.application.secrets.twilio_account_sid
    config.auth_token = Rails.application.secrets.twilio_auth_token
  end


#   client = Twilio::REST::Client.new
# client.messages.create({from: Rails.application.secrets.twilio_phone_number,to: '+13059154158',body: 'Hello there!This is a test'})