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

  describe '#future_game?' do

    it 'should return true for a future game' do
      game = Game.new(game_time: Time.now() + 100000)
      expect(game.future_game?).to be true
    end

    it 'should return false for a past game' do
      game = Game.new(game_time: Time.now() - 100000)
      expect(game.future_game?).to be false
    end

  end
end
