class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.integer :booking_id
      t.string :name

      t.timestamps
    end
  end
end
