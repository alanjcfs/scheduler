class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :date
      t.time :time_start
      t.time :time_end
      t.integer :quantity
      t.integer :amount_sold

      t.timestamps
    end
  end
end
