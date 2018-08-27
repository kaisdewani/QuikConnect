class AccountsController < ApplicationController

  def create
  end

  def index
    @accounts = current_user.accounts
  end

  def destroy
  end

end