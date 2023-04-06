class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_services
  has_one :room_type
  has_many :room_photos, dependent: :destroy
  has_one :rtype, through: :room_type, dependent: :destroy
  has_many :services, through: :room_services, dependent: :destroy

  accepts_nested_attributes_for :room_type, allow_destroy: true


  validates :description, presence: true
  validates :price_per_night, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
