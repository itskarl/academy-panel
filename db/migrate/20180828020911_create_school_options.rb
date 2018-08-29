class CreateSchoolOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :school_options do |t|
      t.string :name
      t.string :school

      t.timestamps
    end
  end
end
