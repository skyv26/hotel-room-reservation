class RtypeSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :room_type
  has_one :room, through: :room_type
end
