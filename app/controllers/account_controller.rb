class AccountController < ApplicationController

    def index
    end

    def creat
    end

    def update
    end
    

    def destory
        @account = Account.new(account_params)
    end
   

    private
    def acconut_params
        params.require(:account).permit()
      end
    
end
