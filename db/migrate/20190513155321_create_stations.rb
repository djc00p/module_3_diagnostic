class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :station_name
      t.string :access_code
      t.string :fuel_type_code
      t.string :access_days_time
      t.string :street_address
      t.string :zip
      t.string :state

      t.timestamps
    end
  end
end
