class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :idnumber
      t.text :firstname
      t.text :lastname
      t.integer :phone
      t.datetime :bookingfor
      t.text :socialclubname
      t.text :socialclublocation

      t.timestamps null: false
    end
  end
end
