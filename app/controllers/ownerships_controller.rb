class OwnershipsController < ApplicationController
  before_action :current_user_must_be_ownership_user,
                only: %i[edit update destroy]

  before_action :set_ownership, only: %i[show edit update destroy]

  def index
    @q = current_user.ownerships.ransack(params[:q])
    @ownerships = @q.result(distinct: true).includes(:user,
                                                     :dog).page(params[:page]).per(10)
  end

  def show; end

  def new
    @ownership = Ownership.new
  end

  def edit; end

  def create
    @ownership = Ownership.new(ownership_params)

    if @ownership.save
      message = "Ownership was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @ownership, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @ownership.update(ownership_params)
      redirect_to @ownership, notice: "Ownership was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ownership.destroy
    message = "Ownership was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to ownerships_url, notice: message
    end
  end

  private

  def current_user_must_be_ownership_user
    set_ownership
    unless current_user == @ownership.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_ownership
    @ownership = Ownership.find(params[:id])
  end

  def ownership_params
    params.require(:ownership).permit(:user_id, :dog_id)
  end
end
