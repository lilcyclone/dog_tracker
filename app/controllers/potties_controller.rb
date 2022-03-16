class PottiesController < ApplicationController
  before_action :set_potty, only: %i[show edit update destroy]

  def index
    @q = Potty.ransack(params[:q])
    @potties = @q.result(distinct: true).includes(:dog).page(params[:page]).per(10)
  end

  def show; end

  def new
    @potty = Potty.new
  end

  def edit; end

  def create
    @potty = Potty.new(potty_params)

    if @potty.save
      message = "Potty was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @potty, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @potty.update(potty_params)
      redirect_to @potty, notice: "Potty was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @potty.destroy
    message = "Potty was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to potties_url, notice: message
    end
  end

  private

  def set_potty
    @potty = Potty.find(params[:id])
  end

  def potty_params
    params.require(:potty).permit(:dog_id, :pee_or_poo)
  end
end
