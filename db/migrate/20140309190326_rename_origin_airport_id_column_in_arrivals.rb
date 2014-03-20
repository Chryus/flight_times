class RenameOriginAirportIdColumnInArrivals < ActiveRecord::Migration
  def change
    rename_column :arrivals, :origin_airport_id, :airport_id
  end
end
