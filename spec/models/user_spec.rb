require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it 'is valid with a name, role, email, and password' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil, role: 'admin', email: 'test@test.com', password: 'password')

      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end


    it 'is invalid without an email' do
      user = User.new(name: 'name', role: 'admin', email: nil, password: 'password')

      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = User.new(name: 'tester', role: 'admin', email: 'test@test.com', password: nil)
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end