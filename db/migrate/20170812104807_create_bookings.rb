class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.date :date1
      t.date :date2
      t.string :country
      t.string :city
      t.string :car
      t.references :user

      t.timestamps
    end
  end
end
