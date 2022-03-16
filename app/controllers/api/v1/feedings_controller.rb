class Api::V1::FeedingsController < Api::V1::GraphitiController
  def index
    feedings = FeedingResource.all(params)
    respond_with(feedings)
  end

  def show
    feeding = FeedingResource.find(params)
    respond_with(feeding)
  end

  def create
    feeding = FeedingResource.build(params)

    if feeding.save
      render jsonapi: feeding, status: 201
    else
      render jsonapi_errors: feeding
    end
  end

  def update
    feeding = FeedingResource.find(params)

    if feeding.update_attributes
      render jsonapi: feeding
    else
      render jsonapi_errors: feeding
    end
  end

  def destroy
    feeding = FeedingResource.find(params)

    if feeding.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: feeding
    end
  end
end
