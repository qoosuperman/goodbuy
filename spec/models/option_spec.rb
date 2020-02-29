require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'should validate presence of name' do
    it { should validate_presence_of(:name) }
  end

  describe 'should validate presence of price' do
    it { should validate_presence_of(:price) }
  end
end
