class AddAirportColumnToDepartures < ActiveRecord::Migration
  def change
    add_column :departures, :airport_id, :integer
  end
end
