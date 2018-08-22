class AccountsController < ApplicationController

    def index
    end

    def creat
       @account = Account.new(account_params)
        if @task.save
            redirect_to account_path, notice: 'Contact information account was successfully created.'
          else
            redirect_to acount_path, notice: "Sorry, could not create new conatct information account because #{@task.errors.full_messages.join(', ').downcase}."
          end
      
    end

    def update
       @account = Task.find(params[:id])
       redirect_to accounts_path notice: "contact information was successfully updated"
    end
    
     # DELETE /acount/1
    def destory
        @account = Account.destory
        redirect_to accounts_path, notice: 'Contact information account was successfully destroyed.'
    end
   

    private
    def acconut_params
        params.require(:account).permit()
      end
    
end
