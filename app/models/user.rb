class User < ApplicationRecord
    has_one :wallet, as: :walletable, dependent: :destroy

    after_create :create_wallet

    private

    def create_wallet
        create_wallet!
    end
end
