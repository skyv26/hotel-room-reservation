class Rtype < ApplicationRecord
  has_one :room, through: :room_type
end
