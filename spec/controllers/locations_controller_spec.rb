require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  describe 'SHOW' do
    it 'assigns location to @location' do
      location = Location.create(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
      get :show, { id: location }
      expect(assigns(:location)).to eq location
    end
  end

end
