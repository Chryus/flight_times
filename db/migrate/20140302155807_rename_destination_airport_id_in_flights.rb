class RenameDestinationAirportIdInFlights < ActiveRecord::Migration
  def change
    rename_column :flights, :destination_aiport_id, :destination_airport_id
  end
end
