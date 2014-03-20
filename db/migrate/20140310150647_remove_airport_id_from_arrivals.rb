class RemoveAirportIdFromArrivals < ActiveRecord::Migration
  def change
    remove_columns :arrivals, :airport_id, :integer
  end
end
