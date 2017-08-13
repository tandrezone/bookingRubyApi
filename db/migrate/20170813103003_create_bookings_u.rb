class CreateBookingsU < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings_us do |t|
      t.string :name
    end
  end
end
