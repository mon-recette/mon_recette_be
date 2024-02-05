require 'rails_helper'

RSpec.describe "Create User", type: :request do
  describe 'via params from frontend' do
    it 'creates a user' do
      params = { email: "test@test.com", password: "1234" }
  
      post "/users", params: { user: params }
      expect(response).to have_http_status(:success)
      user = User.find_by_email("test@test.com")
      expect(user).to be_present
    end

    it "has error message when user can't be created" do
      user = User.create!(email: "test@test.com", password: "1234")
      
      params = { email: "test@test.com", password: "1234" }
      post "/users", params: { user: params }
      expect(response).to_not have_http_status(:success)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:error]).to eq("Email has already been taken")
    end
    
  end
end