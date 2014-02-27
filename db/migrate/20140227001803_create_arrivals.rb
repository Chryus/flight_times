class CreateArrivals < ActiveRecord::Migration
  def change
    create_table :arrivals do |t|

      t.timestamps
    end
  end
end
