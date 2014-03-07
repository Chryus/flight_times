class RemoveColumnsFromFlights < ActiveRecord::Migration
  def change
    remove_columns :flights, :destination_airport_id, :integer
    remove_columns :flights, :origin_airport_id, :integer
  end
end
