class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  def index
    @places = Place.all
    @places = @places.name_match(params['search']) if params['search'].present?

    respond_to do |format|
      format.html
      format.json {
        render json: @places, each_serializer: PlaceSerializer
      }
    end
  end

  # GET /places/1
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Place was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_params
      params[:place].permit([:name, :image, :address])
    end
end
