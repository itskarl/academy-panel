class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :education_level
      t.string :password
      t.string :password_digest
      t.string :email

      t.timestamps
    end
    add_index :students, :password_digest, unique: true
  end
end
