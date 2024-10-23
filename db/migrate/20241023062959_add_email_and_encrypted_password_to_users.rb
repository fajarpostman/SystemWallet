class AddEmailAndEncryptedPasswordToUsers < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:users, :encrypted_password)
      add_column :users, :encrypted_password, :string
    end

    unless column_exists?(:users, :email)
      add_column :users, :email, :string
      add_index :users, :email, unique: true
    end
  end
end
