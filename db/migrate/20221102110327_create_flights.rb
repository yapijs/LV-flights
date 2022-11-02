class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.belongs_to :airplane_rix_list, index:true, foreign_key: true
      t.string :callsign
      t.string :estDepartureAirport
      t.string :estArrivalAirport
      t.datetime :firstSeen
      t.datetime :lastSeen

      t.timestamps
    end
  end
end
