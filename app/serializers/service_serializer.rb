class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :icon
  has_many :room_services
  has_many :rooms, through: :room_services
end
