class DbWritterPlanes
  
  def records
    results.map { |data| 
      data["icao24"]
    }.to_a.uniq
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
    @service ||= WebServices::Plane.new
  end

  def results
    service.results
  end

  def delete_records
    ::Plane.delete_all
  end

  def save_records
    records.each do |record|
      puts records
      entry = Plane.find_or_initialize_by(
        icao24: record,
        visible: false
      )
      
      entry.save!
    end
  end
end