class User < ApplicationRecord
    has_one :wallet, as: :walletable, dependent: :destroy
  
    after_create :create_wallet
  
    validates :email, presence: true, uniqueness: true
    validates :encrypted_password, presence: true
  
    def self.authenticate(email, password)
      user = find_by(email: email)
      user if user&.password_matches?(password)
    end
  
    def password_matches?(password)
      BCrypt::Password.new(encrypted_password) == password
    end
  
    private
  
    def create_wallet
      create_wallet!(balance: 0)
    end
end