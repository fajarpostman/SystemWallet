class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: 'Wallet', optional: true
  belongs_to :target_wallet, class_name: 'Wallet', optional: true

  enum transaction_type: { credit: 0, debit: 1 }
  
  validates :amount, presence: true
  validate :validate_wallets

  private 

  def validate_wallets
    if credit? && source_wallet.present?
      errors.add(:source_wallet, "must be nil for credit transactions")
    elsif debit? && target_wallet.nil?
      errors.add(:target_wallet, "must be present for debit transactions")
    end
  end
end
