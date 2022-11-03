module WebServices
    class Plane
      def results
        if response.is_a?(Net::HTTPSuccess)
          json_document(response.body)
        else
          response.to_s
        end
      end
  
      def response
        @response ||= Net::HTTP.get_response(uri)
      end
  
      private
  
      def uri
        @uri ||= URI(url)
      end
  
      def json_document(content)
        JSON.parse(content)
      end
  
      def url
        @url ||= "https://opensky-network.org/api/flights/arrival?airport=EVRA&begin=1666699200&end=1667131200"
      end
    end
  end