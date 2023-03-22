require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'George', email: 'george@gmail.com', password: '123456')
    @group = Group.new(name: 'Cat 1', icon: 'icon', user: @user)
  end

  it 'name should be valid with correct parameters' do
    expect(@group).to be_valid
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon should be present' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end
end
