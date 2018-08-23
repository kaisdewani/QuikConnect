class AccountsController < ApplicationController

    def index
        @accounts = Account.all

       respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @accounts }
       end
    end

    def create
       @account = current_user.account.new(account_params)

       respond_to do |format|
        if @account.save
            format.html
            redirect_to account_path, notice: 'Contact information account was successfully created.'
          else
            format.html
            format.json
            redirect_to acount_path, notice: "Sorry, could not create new conatct information account because #{@task.errors.full_messages.join(', ').downcase}."
          end
        end
      
    end

    def update
       @account = current_user.account.find(params[:id])
       redirect_to accounts_path notice: "contact information was successfully updated"
    end
    
     # DELETE /acount/1
    def destory
        @account = current_user.account.destory
        redirect_to accounts_path, notice: 'Contact information account was successfully destroyed.'
    end
   

    private
    def acconut_params
        params.require(:account).permit(:url, :name, :phone_number)
      end


    end   