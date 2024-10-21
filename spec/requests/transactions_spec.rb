require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  let!(:user) { create(:user) }
  let!(:wallet) { user.wallet } # Assuming the User model has a Wallet association

  it "creates a transaction" do
    post "/transactions", params: {
      transaction: {
        amount: 600.0, transaction_type: "credit", target_wallet_id: 1
      }
    }

    json_response = JSON.parse(response.body)
    expect(json_response["amount"]).to eq("600.0")
  expect(json_response["transaction_type"]).to eq("credit")
  end
end
