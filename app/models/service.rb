class Service < ApplicationRecord
  has_many :rooms, through: :room_services, dependent: :destroy
end
