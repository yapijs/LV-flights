module WebServices
  class Flight
    attr_reader :start_date, :end_date, :icao24

    def initialize(start_date, end_date, icao24)
      @start_date = Time.parse(start_date).to_i
      @end_date = Time.parse(end_date).to_i
      @icao24 = icao24
    end

    def results
      if response.is_a?(Net::HTTPSuccess)
        json_document(response.body)
      else
        response.to_s
      end
    end

    def response
      response ||= Net::HTTP.get_response(uri)
    end

    private
    def uri
      @uri ||= URI(url)
    end

    def json_document(content)
      JSON.parse(content)
    end

    def url
      @url ||= "https://opensky-network.org/api/flights/aircraft?icao24=#{@icao24}&begin=#{@start_date}&end=#{@end_date}"
    end
  end
end