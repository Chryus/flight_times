class RenameAirportIdColumnInTripsTable < ActiveRecord::Migration
  def change
    rename_column :trips, :airport_id, :destination_id
  end
end
