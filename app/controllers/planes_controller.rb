class PlanesController < ApplicationController
  before_action :set_plane, only: %i[ show edit update destroy ]

  # GET /planes or /planes.json
  def index
    @planes = Plane.all
  end

  # GET /planes/1 or /planes/1.json
  def show
  end

  # GET /planes/new
  def new
    @plane = Plane.new
  end

  # GET /planes/1/edit
  def edit
  end

  # POST /planes or /planes.json
  def create
    
      start_date = time_params[:start]
      end_date = time_params[:end]
      # head 200
      DbWritterPlanes.new(start_date, end_date).load  
      redirect_to planes_url
  end


  # DELETE /planes/1 or /planes/1.json
  def destroy
    @plane.destroy

    respond_to do |format|
      format.html { redirect_to planes_url, notice: "Plane was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plane
      # @plane = Plane.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_params
      params.permit(:start, :end)
    end
end
