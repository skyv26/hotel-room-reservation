require 'rails_helper'

RSpec.describe Hotel, type: :model do
  context 'Hotel validation and model unit testing ...' do
    it 'should check the name and addres of the hotel' do
      hotel = Hotel.new(name: "Danny's Hotel", address: "Nairobi, KENYA")
      expect(hotel).to be_valid
    end
  end
end
