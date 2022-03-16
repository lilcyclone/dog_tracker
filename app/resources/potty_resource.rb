class PottyResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dog_id, :integer
  attribute :pee_or_poo, :string

  # Direct associations

  # Indirect associations

end
