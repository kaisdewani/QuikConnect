class AccountsController < ApplicationController

  def create
    @account = current_user.accounts.build(account_params)
    respond_to do |format|
      if @account.save
          format.html
          redirect_to accounts_path, notice: 'Contact information account was successfully created.'
        else
          format.html
          format.json
          flash[:notice] = "Sorry, could not create new conatct information account because #{@account.errors.full_messages.join(', ').downcase}."
          redirect_back(fallback_location: root_path)
        end
      end
  end

  def index
    @accounts = current_user.accounts
  end

  def show 
    @account = Account.find(params[:id])
  end 

  def destroy
    Account.find(params[:id]).destroy
    redirect_to accounts_path, notice: 'Contact information account was successfully deleted.'
  end

  def new
    @account = Account.new
  end

  def edit 
    @account = Account.find(params[:id])
  end 

  def update
    @account = Account.find(params[:id])
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to accounts_path, notice: "Account was successfully updated"}
      else 
        format.html { render :edit }
      end 
    end 
  end

  private
  def account_params
    params.require(:account).permit(:name, :url)
  end



end