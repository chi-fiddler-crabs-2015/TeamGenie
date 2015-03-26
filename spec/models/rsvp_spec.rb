require 'rails_helper'

RSpec.describe Rsvp, type: :model do
  describe 'associations' do
    it { should belong_to :membership }
    it { should belong_to :game }
  end

  describe 'validations' do
    it { should validate_presence_of(:attending) }

    it 'should have "pending" assigned to attending' do
      testRsvp = Rsvp.create!()
      expect(testRsvp.attending).to eq 'pending'
    end

  end
end
