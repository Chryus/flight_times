class RemoveColumnFromArrivals < ActiveRecord::Migration
  def change
    remove_columns :arrivals, :type, :string
  end
end
