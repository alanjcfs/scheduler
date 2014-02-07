class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :date
      t.time :time_start
      t.time :time_end
      t.integer :quantity, null: false
      t.integer :reserved, default: 0, null: false
      t.references :activity

      t.timestamps
    end
  end
end
