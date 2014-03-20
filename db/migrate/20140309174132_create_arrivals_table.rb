class CreateArrivalsTable < ActiveRecord::Migration
  def change
    create_table :arrivals_tables do |t|
      t.string :type
      t.string :scheduled_time
      t.string :actual_time
      t.belongs_to :flight
      t.references :origin_airport
      t.references :destination_airport
      t.timestamps
    end
  end
end
