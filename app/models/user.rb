class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :ownerships,
             dependent: :destroy

  # Indirect associations

  has_many   :dogs,
             through: :ownerships,
             source: :dog

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
