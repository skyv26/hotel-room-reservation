class RoomServiceSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :room
  belongs_to :service
end
