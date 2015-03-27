require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    it { should have_many :games }
    it { should have_many :memberships }
    it { should have_many(:players).through(:memberships) }
    it { should belong_to(:home_location).class_name("Location") }
    it { should belong_to(:captain).class_name("User") }
  end

  describe 'validations' do
    it { should validate_presence_of(:captain) }
    # it { should validate_presence_of(:home_location) }
    it { should validate_presence_of(:activity) }
    it { should validate_presence_of(:name) }

    describe 'team_logo' do
      it { should have_attached_file(:team_logo) }
      it { should validate_attachment_size(:team_logo).
                    less_than(1.megabytes) }
      it { should validate_attachment_content_type(:team_logo).
                    allowing('image/png', 'image/gif')
                    }
    end
  end
end
