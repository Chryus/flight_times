class DropDeparturesTable < ActiveRecord::Migration
  def up
    drop_table :departures
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
