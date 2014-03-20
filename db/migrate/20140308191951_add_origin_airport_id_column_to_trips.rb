class AddOriginAirportIdColumnToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :origin_id, :integer
  end
end
