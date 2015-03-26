require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'associations' do
    it { should have_many :games }
    it { should have_many :teams }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
  end
end
