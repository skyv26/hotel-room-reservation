class RoomSerializer < ActiveModel::Serializer
  attributes :id, :description, :price_per_night
  has_many :room_photos
  has_many :services, through: :room_services

  has_one :room_type
  has_one :rtype, through: :room_type
end
