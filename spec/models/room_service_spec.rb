require 'rails_helper'

RSpec.describe RoomService, type: :model do
  context '' do
    before do
      hotel = Hotel.new(name: "Danny's Hotel", address: 'Nairobi, KENYA')
      room = Room.new(
        description: 'Full furnished room with all facilites
                      located near to hills with beautiful
                      panoramic view',
        price_per_night: 20, hotel:
      )
      service = Service.new(name: 'Air Conditioner', icon: 'https://www.google.com')
      @room_service = RoomService.new(room:, service:)
    end

    it 'should be valid' do
      expect(@room_service).to be_valid
    end

    it 'should be invalid without room' do
      @room_service.room = nil
      expect(@room_service).to_not be_valid
    end

    it 'should be invalid without service' do
      @room_service.service = nil
      expect(@room_service).to_not be_valid
    end
  end
end
