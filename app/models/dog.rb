class Dog < ApplicationRecord
  # Direct associations

  has_many   :feedings,
             :dependent => :destroy

  has_many   :potties,
             :dependent => :destroy

  has_many   :ownerships,
             :dependent => :destroy

  # Indirect associations

  has_many   :owners,
             :through => :ownerships,
             :source => :user

  # Validations

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
