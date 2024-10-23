class WalletsController < ApplicationController
  def show_balance
    wallet = Wallet.find(params[:id])
    balance = wallet.calculate_balance

    render json: {
      wallet_id: wallet.id,
      balance: balance,
      walletable: {
        id: wallet.walletable_id,
        name: wallet.walletable.name,
        type: wallet.walletable_type
      }
    }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Wallet not found" }, status: :not_found
  end
end
