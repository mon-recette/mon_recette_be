require "rails_helper"

RSpec.describe "Login", type: :request do
  describe "User login" do
    describe "happy path" do
      it "logs in" do
        user = User.create!(email: "test@test.com", password: "1234")
        params = { email: "test@test.com", password: "1234" }
    
        post "/users/login", params: { user: params }
        expect(response).to have_http_status(:success)
        message = JSON.parse(response.body, symbolize_names: true)
        expect(message[:success]).to eq("Welcome, test@test.com!")
        expect(message[:token]).to be_present
      end
    end

    describe "sad path" do
      it "doesn't log in if user doesn't exist" do
        user = User.create!(email: "test@test.com", password: "1234")
        params = { email: "", password: "1234" }
    
        post "/users/login", params: { user: params }
        expect(response).to_not have_http_status(:success)
        message = JSON.parse(response.body, symbolize_names: true)
        expect(message[:error]).to eq("Incorrect credentials.")
        expect(message[:token]).to_not be_present
      end

      it "doesn't log in with wrong password" do
        user = User.create!(email: "test@test.com", password: "1234")
        params = { email: "test@test.com", password: "5678" }
    
        post "/users/login", params: { user: params }
        expect(response).to_not have_http_status(:success)
        message = JSON.parse(response.body, symbolize_names: true)
        expect(message[:error]).to eq("Incorrect credentials.")
        expect(message[:token]).to_not be_present
      end
    end
  end
end