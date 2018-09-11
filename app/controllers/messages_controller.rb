class MessagesController < ApplicationController

    def create
        @account = Account.new()
      
        respond_to do |format|
          if  @account.save
            message = "Hi, it's `#{user.name}`. It was a pleasure meeting you. Here is my following contact information"
            TwilioTextMessenger.new(message).call
            format.html { redirect_to @account, notice: 'Your text was successfully sent.' }
            format.json { render :show, status: :created, location: @account }
          else
            format.html { render :new }
            format.json { render json: @account.errors, status: :unprocessable_entity }
          end
        end
      end

      def new
        @account = Account.new
      end

      def email 
        email = params.fetch("string").fetch("email")
        account_urls = params.fetch("account_urls")
        AccountMailer.with(email: email, account_urls: account_urls).new_message.deliver_later
      end 

      def text
        p params
        number = params.fetch("number").fetch("phone")
        account_urls = params.fetch("account_urls")
        message = ""
        account_urls.each{| url | message += "#{url}\n" }
        p [number, message]
        client = Twilio::REST::Client.new
        options = {
          from: Rails.application.secrets.twilio_phone_number,
          to: '+19546828911',
          body: message
        }
        p options
        p client.messages.create(options)
      end
end