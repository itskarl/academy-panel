class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :password_digest
      t.string :email
      t.boolean :instructor
      t.boolean :student
      t.boolean :admin

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :password_digest, unique: true
  end
end
