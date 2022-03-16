class Feeding < ApplicationRecord
  # Direct associations

  belongs_to :dog

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dog.to_s
  end

end
