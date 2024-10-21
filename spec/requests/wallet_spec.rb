require 'rails_helper'

RSpec.describe "Wallets", type: :request do
  describe "GET /wallets/:id/balance" do
    let!(:wallet) { Wallet.create(balance: 500.0, walletable: User.create(name: "Test User")) }

    it "returns the balance of the wallet" do
        puts "Testing wallet ID: #{wallet.id}" # Cetak ID wallet
        get balance_wallet_path(wallet)
        puts response.body # Tambahkan log untuk melihat respon
        expect(response).to have_http_status(:success)
        expect(response.body).to include(wallet.balance.to_s)
    end
  end
end
