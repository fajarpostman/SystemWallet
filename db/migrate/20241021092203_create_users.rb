# class CreateUsers < ActiveRecord::Migration[7.2]
#   def change
#     create_table :users do |t|
#       t.string :name

#       t.timestamps
#     end
#   end
# end

class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, unique: true # Menambahkan kolom email
      t.string :encrypted_password # Menambahkan kolom untuk menyimpan password yang dienkripsi

      t.timestamps
    end

    add_index :users, :email, unique: true # Menambahkan index unik pada kolom email
  end
end

