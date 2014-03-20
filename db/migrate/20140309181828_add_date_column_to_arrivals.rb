class AddDateColumnToArrivals < ActiveRecord::Migration
  def change
    add_column :arrivals, :date, :datetime
  end
end
