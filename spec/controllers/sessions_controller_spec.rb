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
      it "should redirect to the root path" do
        view =
          post :create, { user: {email: user.email, password: user.password } }
        expect(view).to redirect_to root_path
      end
    end

    describe "when invalid parameters are passed" do
      it "should re-render the new page" do
        view =
          post :create, { user: {email: user.email, password: "brokenpassword" } }
        expect(view).to render_template("new")
      end
    end
  end

end
