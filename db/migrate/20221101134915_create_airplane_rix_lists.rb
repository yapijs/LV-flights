class CreateAirplaneRixLists < ActiveRecord::Migration[6.1]
  def change
    create_table :airplane_rix_lists do |t|
      t.string :icao24

      t.timestamps
    end
  end
end
