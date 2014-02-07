class AddPriceToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :price, :integer, null: false, default: 0
  end
end
