class RemoveDestinationColumnFromArrivals < ActiveRecord::Migration
  def change
    remove_columns :arrivals, :destination, :string
  end
end
