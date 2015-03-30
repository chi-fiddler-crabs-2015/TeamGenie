require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  describe 'SHOW' do
    it 'assigns location to @location' do
      location = Location.create(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
      get :show, { id: location }
      expect(assigns(:location)).to eq location
    end
  end

  describe 'CREATE' do
    it 'does not create a new location for invalid location' do
      expect{post :create, location: { name: 'hello', state: 'IL', city: 'Chicago' } }.to_not change{Location.count}
    end

    it 're-renders the new page for invalid location' do
      expect(post :create, location: { name: 'hello', state: 'IL', city: 'Chicago' } ).to render_template 'new'
    end

    it 'creates a new location for a valid location' do
      expect{post :create, location: { name: 'hello', address: '111 State St', state: 'IL', city: 'Chicago' } }.to change{Location.count}.by 1
    end
  end

end
