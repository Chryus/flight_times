class AddColumnsToArrivalsTable < ActiveRecord::Migration
  def change
    add_column :arrivals, :origin_airport_id, :integer
    add_column :arrivals, :departure_airport_id, :integer
  end
end
