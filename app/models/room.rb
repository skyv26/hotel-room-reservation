class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_photos, dependent: :destroy
  has_one :rtype, through: :room_type, dependent: :destroy
  has_many :services, through: :room_services , dependent: :destroy
end
