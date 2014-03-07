class DropArrivalsTable < ActiveRecord::Migration
  def up
    drop_table :arrivals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
