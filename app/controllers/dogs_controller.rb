class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  # GET /dogs
  def index
    @q = Dog.ransack(params[:q])
    @dogs = @q.result(:distinct => true).includes(:ownerships, :potties, :feedings, :owners).page(params[:page]).per(10)
  end

  # GET /dogs/1
  def show
    @feeding = Feeding.new
    @potty = Potty.new
    @ownership = Ownership.new
  end

  # GET /dogs/new
  def new
    @dog = Dog.new
  end

  # GET /dogs/1/edit
  def edit
  end

  # POST /dogs
  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to @dog, notice: 'Dog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dogs/1
  def update
    if @dog.update(dog_params)
      redirect_to @dog, notice: 'Dog was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy
    redirect_to dogs_url, notice: 'Dog was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_params
      params.require(:dog).permit(:name)
    end
end
