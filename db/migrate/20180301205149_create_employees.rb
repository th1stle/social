class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :idnumber
      t.text :firstname
      t.text :lastname

      t.timestamps null: false
    end
  end
end
