require 'rails_helper'

RSpec.describe Room, type: :model do
  context 'validation and unit testing' do
    before do
      @hotel = Hotel.new(name: "Danny's Hotel", address: "Nairobi, KENYA")
      @room = Room.new(description: 'Full furnished room with all facilites located near to hills with beautiful panoramic view')
    end

    it 'should results invalid without reference and price' do
      expect(@room).to_not be_valid
    end

    it 'should results invalid without reference' do
      @room.price_per_night = 20
      expect(@room).to_not be_valid
    end

    it 'should results valid' do
      @room.price_per_night = 20
      @room.hotel = @hotel
      expect(@room).to be_valid
    end

    it 'should results invalid because price_per_night should be positive' do
      @room.price_per_night = -20
      @room.hotel = @hotel
      expect(@room).to_not be_valid
    end

  end
end
