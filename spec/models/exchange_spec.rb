require 'rails_helper'

RSpec.describe Exchange, type: :model do
  before :each do
    @user = User.new(name: 'George', email: 'george@gmail.com', password: '123456')
    @exchange = Exchange.new(name: 'Ent 1', amount: 1, author: @user)
  end

  it 'name should be valid with correct parameters' do
    expect(@exchange).to be_valid
  end

  it 'name should be present' do
    @exchange.name = nil
    expect(@exchange).to_not be_valid
  end

  it 'icon should be present' do
    @exchange.amount = 0
    expect(@exchange).to_not be_valid
  end
end