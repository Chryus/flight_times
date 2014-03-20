class RenameArrivalsTable < ActiveRecord::Migration
  def change
    rename_table :arrivals_tables, :arrivals
  end
end
