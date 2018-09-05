# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    
    
    def new_email
        email_message = Email_message
        UserMailer.new_email (email_message)
    end

end
