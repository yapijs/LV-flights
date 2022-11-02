  class DbWritterFlights
    def records
      @records ||= results.map do |data| 
        {
          icao24: data["icao24"],
          firstSeen: Time.at(data["firstSeen"]).utc.to_datetime,
          lastSeen: Time.at(data["lastSeen"]).utc.to_datetime,
          callsign: data["callsign"],
          estArrivalAirport: data["estArrivalAirport"],
          estDepartureAirport: data["estDepartureAirport"]
        }
      end
    end
  
    def load!
      ActiveRecord::Base.transaction do
        delete_records
        save_records
      end
      true
    end
  
    def load
      ActiveRecord::Base.transaction do
        save_records
      end
      true
    end
  
  
    private
    def service
      @service ||= WebServices::Flight.new
    end
  
    def results
      service.results
    end
  
    def delete_records
      ::Flight.delete_all
    end
  
    def save_records
      records.each do |record|
        entry = Flight.new(
          icao24: record[:icao24],
          callsign: record[:callsign],
          firstSeen: record[:firstSeen],
          lastSeen: record[:lastSeen],
          estDepartureAirport: record[:estDepartureAirport],
          estArrivalAirport: record[:estArrivalAirport]
        )

        entry.save!
      end
    end
  end