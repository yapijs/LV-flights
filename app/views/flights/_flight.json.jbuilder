json.extract! flight, :id, :callsign, :estDepartureAirport, :estArrivalAirport, :firstSeen, :lastSeen, :created_at, :updated_at
json.url flight_url(flight, format: :json)
