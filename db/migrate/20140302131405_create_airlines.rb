class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :carrier
      t.timestamps
    end
  end
end
