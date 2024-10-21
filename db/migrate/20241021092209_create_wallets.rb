class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.decimal :balance, default: 0.0, null: false
      t.references :walletable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
