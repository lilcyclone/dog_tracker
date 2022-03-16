class FeedingsController < ApplicationController
  before_action :set_feeding, only: [:show, :edit, :update, :destroy]

  # GET /feedings
  def index
    @feedings = Feeding.all
  end

  # GET /feedings/1
  def show
  end

  # GET /feedings/new
  def new
    @feeding = Feeding.new
  end

  # GET /feedings/1/edit
  def edit
  end

  # POST /feedings
  def create
    @feeding = Feeding.new(feeding_params)

    if @feeding.save
      redirect_to @feeding, notice: 'Feeding was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /feedings/1
  def update
    if @feeding.update(feeding_params)
      redirect_to @feeding, notice: 'Feeding was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /feedings/1
  def destroy
    @feeding.destroy
    message = "Feeding was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to feedings_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeding
      @feeding = Feeding.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feeding_params
      params.require(:feeding).permit(:dog_id, :amount, :food_name)
    end
end
