class Wallet < ApplicationRecord
  belongs_to :walletable, polymorphic: true
  has_many :source_transactions, class_name: 'Transaction', foreign_key: :source_wallet_id, dependent: :destroy
  has_many :target_transactions, class_name: 'Transaction', foreign_key: :target_wallet_id, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  def update_balance(amount)
    self.balance += amount
    save!
  end

  def calculate_balance
    total_income = target_transactions.sum(:amount)
    total_outgo = source_transactions.sum(:amount)
    self.balance = total_income - total_outgo
    save!
  end
end
