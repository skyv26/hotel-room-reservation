class RoomPhoto < ApplicationRecord
  belongs_to :room

  validates :photo_path, presence: true, length: { greater_than: 5 }
end
