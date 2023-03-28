require 'rails_helper'

RSpec.describe RoomType, type: :model do
  context '' do
    before do
      hotel = Hotel.new(name: "Danny's Hotel", address: 'Nairobi, KENYA')
      room = Room.new(
        description: 'Full furnished room with all facilites
                      located near to hills with beautiful
                      panoramic view',
        price_per_night: 20, hotel:
      )
      rtype = Rtype.new(name: '2BHK room')
      @room_type = RoomType.new(room:, rtype:)
    end

    it 'should be valid' do
      expect(@room_type).to be_valid
    end

    it 'should be invalid without room' do
      @room_type.room = nil
      expect(@room_type).to_not be_valid
    end

    it 'should be invalid without rtype' do
      @room_type.rtype = nil
      expect(@room_type).to_not be_valid
    end
  end
end
