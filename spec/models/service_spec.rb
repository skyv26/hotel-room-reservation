require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'validates and unit-test' do
    before do
      @service = Service.new(name: 'Air Conditioner', icon: 'https://www.google.com')
    end

    it 'should check the model validity' do
      expect(@service).to be_valid
    end

    it 'should results invalid without name' do
      @service.name = nil
      expect(@service).to_not be_valid
    end

    it 'should results invalid without icon' do
      @service.icon = nil
      expect(@service).to_not be_valid
    end
  end
end
