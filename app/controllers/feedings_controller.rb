class FeedingsController < ApplicationController
  before_action :set_feeding, only: %i[show edit update destroy]

  def index
    @q = Feeding.ransack(params[:q])
    @feedings = @q.result(distinct: true).includes(:dog).page(params[:page]).per(10)
  end

  def show; end

  def new
    @feeding = Feeding.new
  end

  def edit; end

  def create
    @feeding = Feeding.new(feeding_params)

    if @feeding.save
      message = "Feeding was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @feeding, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @feeding.update(feeding_params)
      redirect_to @feeding, notice: "Feeding was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @feeding.destroy
    message = "Feeding was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to feedings_url, notice: message
    end
  end

  private

  def set_feeding
    @feeding = Feeding.find(params[:id])
  end

  def feeding_params
    params.require(:feeding).permit(:dog_id, :amount, :food_name)
  end
end
