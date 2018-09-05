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
        email = params.fetch("email")
        mail = params.fetch("message")
        AccountMailer.new_message(@message).deliver_now
      end 

      def text
        p params
        number = params.fetch("number").fetch("phone")
        message = params.fetch("message")
        p [number, message]
        client = Twilio::REST::Client.new
        options = {
          from: Rails.application.secrets.twilio_phone_number,
          to: '+13059154158',
          body: message
        }
        p options
        p client.messages.create(options)
      end
end