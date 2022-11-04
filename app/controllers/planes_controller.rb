class PlanesController < ApplicationController
  before_action :set_plane, only: %i[ show edit update destroy request_flights ]

  # GET /planes or /planes.json
  def index
    @planes = Plane.all
  end

  # GET /planes/1 or /planes/1.json
  def show
  end

  def create
    start_date = time_params[:start]
    end_date = time_params[:end]
    # head 200
    DbWritterPlanes.new(start_date, end_date).load  
    redirect_to planes_url
  end

  def request_flights
    @plane.visible = false
    plane_params = params[:plane]
    # head 200
    DbWritterFlights.new(plane_params[:start], plane_params[:end], @plane[:icao24]).load  
    redirect_to @plane
  end

  def delete
    Plane.destroy_all
    redirect_to planes_url
  end

  private
    def set_plane
      @plane = Plane.find(id_params[:id])
    end

    def time_params
      params.permit(:start, :end, :plane)
    end

    def id_params
      params.permit(:id)
    end
end
