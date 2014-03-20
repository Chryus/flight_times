class RenameDepartureAirportIdColumnInArrivals < ActiveRecord::Migration
  def change
    rename_column :arrivals, :departure_airport_id, :destination_airport_id
  end
end
