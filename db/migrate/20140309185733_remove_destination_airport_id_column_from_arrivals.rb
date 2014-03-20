class RemoveDestinationAirportIdColumnFromArrivals < ActiveRecord::Migration
  def change
    remove_columns :arrivals, :destination_airport_id, :integer
  end
end
