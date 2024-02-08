require 'rails_helper'

RSpec.describe Recipe do
  describe 'validations' do
    it {should belong_to(:user)}

    it {should validate_presence_of(:ingredients)}
    it {should validate_presence_of(:instructions)}
    it {should validate_presence_of(:name)}

  end
end