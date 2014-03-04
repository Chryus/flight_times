class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :number
      t.belongs_to :airline
      t.references :origin_airport
      t.references :destination_aiport
      t.timestamps
    end
  end
end