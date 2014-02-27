class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|

      t.timestamps
    end
  end
end
