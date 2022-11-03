  class DbWritterFlights
    attr_reader :start_date, :end_date, :icao24

    def initialize(start_date, end_date, icao24)
      @start_date = start_date
      @end_date = end_date
      @icao24 = icao24
    end
    
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
      @service ||= WebServices::Flight.new(@start_date, @end_date, @icao24)
    end
  
    def results
      service.results
    end
  
    def delete_records
      ::Flight.delete_all
    end
  
    def save_records
      records.each do |record|
        plane = Plane.find_by_icao24(@icao24)
      
        plane.flights.create(          
          callsign: record[:callsign],
          firstSeen: record[:firstSeen],
          lastSeen: record[:lastSeen],
          estDepartureAirport: record[:estDepartureAirport],
          estArrivalAirport: record[:estArrivalAirport]
        )

      end
    end
  end