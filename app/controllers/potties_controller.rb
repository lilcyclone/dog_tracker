class PottiesController < ApplicationController
  before_action :set_potty, only: [:show, :edit, :update, :destroy]

  # GET /potties
  def index
    @potties = Potty.all
  end

  # GET /potties/1
  def show
  end

  # GET /potties/new
  def new
    @potty = Potty.new
  end

  # GET /potties/1/edit
  def edit
  end

  # POST /potties
  def create
    @potty = Potty.new(potty_params)

    if @potty.save
      redirect_to @potty, notice: 'Potty was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /potties/1
  def update
    if @potty.update(potty_params)
      redirect_to @potty, notice: 'Potty was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /potties/1
  def destroy
    @potty.destroy
    redirect_to potties_url, notice: 'Potty was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potty
      @potty = Potty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def potty_params
      params.require(:potty).permit(:dog_id, :pee_or_poo)
    end
end
