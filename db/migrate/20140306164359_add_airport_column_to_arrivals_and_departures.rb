class AddAirportColumnToArrivalsAndDepartures < ActiveRecord::Migration
  def change
    add_column :arrivals, :airport_id, :integer
  end
end
