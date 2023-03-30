class Hotel < ApplicationRecord
  has_many :rooms, dependent: :delete_all

  validates :name, :address, presence: true
end
