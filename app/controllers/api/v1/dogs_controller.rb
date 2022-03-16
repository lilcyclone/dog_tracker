class Api::V1::DogsController < Api::V1::GraphitiController
  def index
    dogs = DogResource.all(params)
    respond_with(dogs)
  end

  def show
    dog = DogResource.find(params)
    respond_with(dog)
  end

  def create
    dog = DogResource.build(params)

    if dog.save
      render jsonapi: dog, status: :created
    else
      render jsonapi_errors: dog
    end
  end

  def update
    dog = DogResource.find(params)

    if dog.update_attributes
      render jsonapi: dog
    else
      render jsonapi_errors: dog
    end
  end

  def destroy
    dog = DogResource.find(params)

    if dog.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: dog
    end
  end
end
