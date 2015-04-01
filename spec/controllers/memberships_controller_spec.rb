require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:location) { create(:location) }

  before(:each) do
    allow_any_instance_of(MembershipsController).to receive(:current_user).and_return(user)
  end


end