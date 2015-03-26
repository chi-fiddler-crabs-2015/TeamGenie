require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'associations' do
    it { should belong_to :player }
    it { should belong_to :team }
  end
end
