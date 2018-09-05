class SharesController < ApplicationController

  def create
    @accounts = current_user.accounts.where(id: shares_params.keys) rescue nil

    if @accounts.present?
      ### actually send the email here
      redirect_to shares_path(account_ids: @accounts.pluck(:id))
    else
      redirect_to accounts_path, notice: "You need to share an account" 
    end
    
  
  end

  def show
    @accounts = current_user.accounts.where(id: params[:account_ids])
  end

  private

  def shares_params
    
    params.require(:share).permit!
  
  end

end