class DropTripsTable < ActiveRecord::Migration
  def up
    drop_table :trips
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
