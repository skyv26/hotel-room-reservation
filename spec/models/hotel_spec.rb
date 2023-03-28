require 'rails_helper'

RSpec.describe Hotel, type: :model do
  context 'validation and model unit testing ...' do
    before do
      @hotel = Hotel.new(name: "Danny's Hotel", address: 'Nairobi, KENYA')
    end

    it 'should check the name and addres of the hotel' do
      expect(@hotel).to be_valid
    end

    it 'should results invalid without name' do
      @hotel.name = nil
      expect(@hotel).to_not be_valid
    end

    it 'should results invalid without address' do
      @hotel.address = nil
      expect(@hotel).to_not be_valid
    end
  end
end
