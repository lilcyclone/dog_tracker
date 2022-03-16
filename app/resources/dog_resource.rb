class DogResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string

  # Direct associations

  has_many   :feedings

  has_many   :potties

  has_many   :ownerships

  # Indirect associations

  many_to_many :owners,
               resource: UserResource
end
