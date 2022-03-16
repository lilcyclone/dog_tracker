class FeedingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dog_id, :integer
  attribute :amount, :string
  attribute :food_name, :string

  # Direct associations

  belongs_to :dog

  # Indirect associations

end
