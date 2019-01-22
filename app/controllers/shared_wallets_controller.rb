class SharedWalletsController < ApplicationController
  def show
    @sharedwallet = SharedWallet.find(params[:id])
  end

  def new
    @sharedwallet = SharedWallet.new
    @sharedwallet = SharedWallet.all
  end

  def create
    @sharedwallet = SharedWallet.create(sw_params)
    # redirect_to sharedwallet_path(@sharedwallet)
  end 

  def edit
    @sharedwallet = SharedWallet.find(params[:id])
  end

  def update
    @sharedwallet = SharedWallet.find(params[:id])
    @sharedwallet.update(params.require(:sharedwallet))
    # redirect_to sharedwallet_path(@sharedwallet)
  end

  private

  def sw_params
    params.require(:sharedwallet).permit(:personal_expense_id, :shared_expense_id)
   end
end