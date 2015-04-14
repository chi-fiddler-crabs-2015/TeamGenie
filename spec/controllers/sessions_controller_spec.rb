require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }

  context "GET #new" do
    describe 'when valid parameters are passed' do
      it "should render the login template" do
        expect(get :new).to render_template("new")
      end
    end
  end

  context "POST #create" do
    describe "when valid parameters are passed" do
      it "should redirect to the teams path" do
        view =
          post :create, { user: {email: user.email, password: user.password } }
        expect(view).to redirect_to teams_path
      end

      it "should assign @user to user" do
        post :create, { user: {email: user.email, password: user.password } }
        expect(assigns(:user)).to eq user
      end
    end

    describe "when invalid parameters are passed" do
      it "should re-render the new page" do
        view =
          post :create, { user: {email: user.email, password: "brokenpassword" } }
        expect(view).to redirect_to login_path
      end
    end
  end

  context "POST #destroy" do
    describe "when user logs out they are redirected to the home page" do
      it "should redirect to the root path" do
        expect(delete :destroy).to redirect_to root_path
      end
    end
  end

end
