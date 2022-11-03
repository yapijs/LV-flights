class PlanesController < ApplicationController
  before_action :set_plane, only: %i[ show edit update destroy ]

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

  def delete
    Plane.delete_all
    redirect_to planes_url
  end

  private
    def set_plane
      @plane = Plane.find(id_params[:id])
    end

    def time_params
      params.permit(:start, :end)
    end

    def id_params
      params.permit(:id)
    end
end
