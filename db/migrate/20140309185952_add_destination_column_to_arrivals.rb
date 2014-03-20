class AddDestinationColumnToArrivals < ActiveRecord::Migration
  def change
    add_column :arrivals, :destination, :string
  end
end
