class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :education_level
      t.string :salary
      t.string :password
      t.string :password_digest
      t.string :email

      t.timestamps
    end
    add_index :instructors, :password_digest, unique: true
  end
end
