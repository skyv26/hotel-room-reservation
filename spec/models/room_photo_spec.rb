require 'rails_helper'

RSpec.describe RoomPhoto, type: :model do
  context 'validation and unit-test' do    
    before do
      hotel = Hotel.new(name: "Danny's Hotel", address: "Nairobi, KENYA")
      room = Room.new(description: 'Full furnished room with all facilites located near to hills with beautiful panoramic view', price_per_night: 20, hotel:)
      @room_photo = RoomPhoto.new(photo_path: 'https://www.google.com', room:)
    end

    it 'shoud check the model valid and results in pass' do
      expect(@room_photo).to be_valid
    end

    it 'shoud results invalid' do
      @room_photo.photo_path = nil
      expect(@room_photo).to_not be_valid
    end

    it 'shoud results invalid photo_path should be atleast 5 characters' do
      @room_photo.photo_path = 'Dan'
      expect(@room_photo).to_not be_valid
    end
  end
end
