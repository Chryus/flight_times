class RenameCarrierColumnInAirlines < ActiveRecord::Migration
  def change
    rename_column :airlines, :carrier, :name
  end
end
