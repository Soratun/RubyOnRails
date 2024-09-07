# spec/controllers/users_controller_spec.rb
require "rails_helper"

RSpec.describe UsersController, type: :controller do
    let(:user_params) do
        {
        firstname: "test",
        lastname: "test",
        birthday: "2024-09-03",
        gender: "Male",
        email: "test@test.com",
        phonenumber: "0987654321",
        subject: "css"
        }
    end

    describe "POST #create" do
        it "creates a new user" do
        expect {
            post :create, params: { user: user_params }
        }.to change(User, :count).by(1)
        end
    end

    describe "Get #index" do
        it "returns a success response" do
            get :index
            expect(response).to be_successful
        end
    end

    describe "Get #new" do
        it "returns a success response" do
            get :new
            expect(response).to be_successful
        end
    end
    
    describe "Get #show" do
        it  "returns a success response" do
            User.create! user_params
            get :show, params: { id: User.last.id }
            expect(response).to be_successful  
        end
    end
  
    describe "Get #edit" do
        it "returns a success response" do
            User.create! user_params
            get :edit, params: { id: User.last.id }
            expect(response).to be_successful  
        end
    end
  
    describe "PATCH #update" do
        let!(:user) { User.create!(user_params) }

        it "updates the requested user" do
            patch :update, params: { id: user.id, user: { firstname: "new name" } }
            user.reload
            expect(user.firstname).to eq("new name")
        end
    end

    describe "DELETE #destroy" do
        it "destroys the requested user" do
            User.create! user_params
            delete :destroy, params: { id: User.last.id }
        end
    end
end
