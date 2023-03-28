require 'rails_helper'

RSpec.describe Rtype, type: :model do
  context 'validation and unit tests' do
    before do
      @rtype = Rtype.new()
    end

    it 'should results invalid without name' do
      expect(@rtype).to_not be_valid
    end

    it 'should pass by adding valid name' do
      @rtype.name = '2BHK room'
      expect(@rtype).to be_valid
    end
  end
end
