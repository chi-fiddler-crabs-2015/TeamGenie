require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'associations' do
    it { should have_many :rsvps }
    it { should belong_to :team }
    it { should belong_to :location }
  end

  describe 'validations' do
    it { should validate_presence_of(:game_time) }
    it { should validate_presence_of(:location) }
  end
end
