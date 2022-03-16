class Api::V1::PottiesController < Api::V1::GraphitiController
  def index
    potties = PottyResource.all(params)
    respond_with(potties)
  end

  def show
    potty = PottyResource.find(params)
    respond_with(potty)
  end

  def create
    potty = PottyResource.build(params)

    if potty.save
      render jsonapi: potty, status: :created
    else
      render jsonapi_errors: potty
    end
  end

  def update
    potty = PottyResource.find(params)

    if potty.update_attributes
      render jsonapi: potty
    else
      render jsonapi_errors: potty
    end
  end

  def destroy
    potty = PottyResource.find(params)

    if potty.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: potty
    end
  end
end
