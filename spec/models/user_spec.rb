require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :teams }
    it { should have_many :memberships }
    it { should have_many(:rsvps).through(:memberships) }
    it { should have_many(:games).through(:rsvps) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:email) }

    it { should allow_value('hello@hello.com').for(:email) }
    it { should_not allow_value('hellohello.com').for(:email) }
  end
end
