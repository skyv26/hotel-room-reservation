class Rtype < ApplicationRecord
  has_one :room_type
  has_many :room, through: :room_type

  validates :name, presence: true
end
