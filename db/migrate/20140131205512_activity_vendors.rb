class ActivityVendors < ActiveRecord::Migration
  def change
    create_table :activity_vendors do |t|
      t.references :activity
      t.references :vendor
      t.timestamps
    end

    add_index :activity_vendors, [:activity_id, :vendor_id]
  end
end
