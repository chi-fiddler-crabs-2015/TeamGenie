require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST create" do

    context 'when valid parameters are passed' do
      let(:user) {create(:user)}

      it 'assigns a newly created user as a user' do
        post :create, { user: user.attributes }
        expect(assigns(:user)).to be_a User
      end

      it 'creates a new user' do
        expect {
          post :create, { user: user.attributes }
        }.to change{User.count}.by(1)
      end

      it 'redirects to the teams path' do
        expect(
          post :create, { user: { username: "fakeyfakey3", first_name: "David", last_name: "V", email: "fake23@fake2.com", password: "123456789012345678901437", phone_number: "1234567890" } }
        ).to redirect_to teams_path
      end
    end

    context 'when invalid parameters are passed' do
      let!(:user_test) { User.create(username: "fakeyfakey", email: "fake2@fake2.com", password: "123456789012345678901437")}

      let!(:user_test_2) { User.create(username: "fakeyfakey2", email: "fake2@fake2.com", password: "123456789012345678901437")}

      it 'assigns a newly created user but unsaved' do
        post :create, { user: { username: '1' } }
        expect(assigns(:user)).to be_a_new User
      end

      it 'does not allow a user to create with a missing username' do
        post :create, { user: {email: "fake@fake.com", password: "12345678"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create with a missing email' do
        post :create, { user: {username: "fakefake", password: "12345678"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create with a missing password' do
        post :create, { user: {username: "fakefake", email: "fake@fake.com"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create with a password less than 6 characters' do
        post :create, { user: {username: "fakefake", email: "fake@fake.com", password: "12345"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create with a username less than 6 characters' do
        post :create, { user: {username: "fake", email: "fake@fake.com", password: "123456789012345678901437"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create with an invalid email' do
        post :create, { user: {username: "fakefake", email: "fakefake.com", password: "123456789012345678901437"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create without a unique username' do
        post :create, { user: {username: "fakeyfakey", email: "fake@fake.com", password: "123456789012345678901437"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create without a unique email' do
        post :create, { user: {username: "fakeyfakey3", email: "fake2@fake2.com", password: "123456789012345678901437"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it 'does not allow a user to create with an invalid username' do
        post :create, { user: {username: "*$&%^%^", email: "fakefake.com", password: "123456789012345678901437"} }
        expect(assigns(:errors)).to_not be_nil
      end

      it "re-renders the 'new' template" do
        expect(
          post :create, { user: { username: '1' } }
        ).to render_template 'new'
      end
    end
  end

end



