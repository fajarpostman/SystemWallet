class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount, null: false
      t.integer :transaction_type, null: false
      t.references :source_wallet, foreign_key: { to_table: :wallets }, null: true
      t.references :target_wallet, foreign_key: { to_table: :wallets }, null: true

      t.timestamps
    end
  end
end
