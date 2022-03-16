class Potty < ApplicationRecord
  # Direct associations

  belongs_to :dog

  # Indirect associations

  # Validations

  validates :pee_or_poo, :presence => true

  validates :pee_or_poo, :inclusion => { :in => [ "pee", "poo", "both" ]  }

  # Scopes

  def to_s
    dog.to_s
  end

end
