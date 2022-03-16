class Api::V1::OwnershipsController < Api::V1::GraphitiController
  def index
    ownerships = OwnershipResource.all(params)
    respond_with(ownerships)
  end

  def show
    ownership = OwnershipResource.find(params)
    respond_with(ownership)
  end

  def create
    ownership = OwnershipResource.build(params)

    if ownership.save
      render jsonapi: ownership, status: 201
    else
      render jsonapi_errors: ownership
    end
  end

  def update
    ownership = OwnershipResource.find(params)

    if ownership.update_attributes
      render jsonapi: ownership
    else
      render jsonapi_errors: ownership
    end
  end

  def destroy
    ownership = OwnershipResource.find(params)

    if ownership.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: ownership
    end
  end
end
