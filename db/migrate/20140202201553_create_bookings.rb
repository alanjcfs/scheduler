class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :schedule

      t.timestamps
    end
  end
end
