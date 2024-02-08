require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}

    it {should have_many(:recipes)}
  end
end