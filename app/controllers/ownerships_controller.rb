class OwnershipsController < ApplicationController
  before_action :set_ownership, only: [:show, :edit, :update, :destroy]

  # GET /ownerships
  def index
    @ownerships = Ownership.all
  end

  # GET /ownerships/1
  def show
  end

  # GET /ownerships/new
  def new
    @ownership = Ownership.new
  end

  # GET /ownerships/1/edit
  def edit
  end

  # POST /ownerships
  def create
    @ownership = Ownership.new(ownership_params)

    if @ownership.save
      message = 'Ownership was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @ownership, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /ownerships/1
  def update
    if @ownership.update(ownership_params)
      redirect_to @ownership, notice: 'Ownership was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ownerships/1
  def destroy
    @ownership.destroy
    message = "Ownership was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to ownerships_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ownership
      @ownership = Ownership.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ownership_params
      params.require(:ownership).permit(:user_id, :dog_id)
    end
end
