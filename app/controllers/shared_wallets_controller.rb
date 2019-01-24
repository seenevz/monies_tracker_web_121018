class SharedWalletsController < ApplicationController
  before_action :find_shared_wallet, except: [:index, :new, :create]
  before_action :find_user, except: [:create, :destroy]

  def index
    # byebug
    @shared_wallets = @user.shared_wallets
  end

  def show
  end

  def new
    @shared_wallet = SharedWallet.new
  end

  def create
    @shared_wallet = SharedWallet.create(sw_params)
    redirect_to user_shared_wallet_path(@shared_wallet)
  end 

  def edit
    @shared_wallet = SharedWallet.find(params[:id])
  end

  def update
    @shared_wallet = SharedWallet.find(params[:id])
    @shared_wallet.update(sw_params)
    redirect_to user_shared_wallet_path(@shared_wallet)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_shared_wallet
    @shared_wallet = SharedWallet.find(params[:id])
  end

  def sw_params
    params.require(:shared_wallet).permit(:personal_expense_id, :shared_expense_id)
   end
end