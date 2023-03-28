class RoomPhoto < ApplicationRecord
  belongs_to :room

  validates :photo_path, presence: true
end
