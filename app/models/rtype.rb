class Rtype < ApplicationRecord
  # has_one :room_type
  has_one :room, through: :room_type

  validates :name, presence: true
end
