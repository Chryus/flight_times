class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|
      t.datetime :date
      t.string :scheduled_time
      t.string :actual_time
      t.belongs_to :flight
      t.timestamps
    end
  end
end