class TransactionsController < ApplicationController
    def create
      transaction = Transaction.new(transaction_params)
  
      if transaction.save
        if transaction.credit?
          transaction.target_wallet.update_balance(transaction.amount)
        elsif transaction.debit?
          transaction.source_wallet.update_balance(-transaction.amount)
        end
  
        transaction.source_wallet.calculate_balance if transaction.source_wallet
        transaction.target_wallet.calculate_balance if transaction.target_wallet
  
        # Menambahkan informasi nama pengguna
        user_name = transaction.user.name if transaction.user.present?
  
        render json: {
          transaction: transaction,
          user_name: user_name
        }, status: :created
      else
        render json: transaction.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:amount, :transaction_type, :source_wallet_id, :target_wallet_id, :user_id)
    end
end