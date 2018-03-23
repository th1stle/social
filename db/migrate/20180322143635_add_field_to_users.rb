class AddFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :idnumber, :string
  end
end
