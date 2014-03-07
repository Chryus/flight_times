class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :type
      t.string :scheduled_time
      t.string :actual_time
      t.belongs_to :flight
      t.belongs_to :airport
      t.timestamps
    end
  end
end
