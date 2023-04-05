class RoomTypeSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :room
  belongs_to :rtype
end
