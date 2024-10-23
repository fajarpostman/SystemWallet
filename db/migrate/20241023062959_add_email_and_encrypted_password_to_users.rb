class AddEmailAndEncryptedPasswordToUsers < ActiveRecord::Migration[7.2]
  def change
    # Tambahkan kolom email tanpa null: false
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string

    # Tambahkan indeks unik untuk kolom email
    add_index :users, :email, unique: true
  end
end
