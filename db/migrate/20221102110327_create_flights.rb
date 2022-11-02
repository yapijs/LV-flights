class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :icao24
      t.string :callsign
      t.string :estDepartureAirport
      t.string :estArrivalAirport
      t.datetime :firstSeen
      t.datetime :lastSeen

      t.timestamps
    end
  end
end
