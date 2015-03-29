require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }

  context "GET #show" do
    describe 'when valid parameters are passed' do
      it "should render the login template" do
        expect(get :new).to render_template("new")
      end
    end
  end

end
