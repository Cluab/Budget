require 'rails_helper'

RSpec.describe 'Exchange page', type: :feature do
  before :each do
    @user1 = create(:user, email: 'cluab@test.com', password: '123456')
    @category = create(:group, name: 'test1', user: @user1)
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should be able to see exchanges' do
    click_on 'test1'
    expect(page).to have_content('Total Amount:')
  end

  it 'should be able to redirect to add new exchange' do
    click_on 'test1'
    click_link 'New Exchange'
    expect(page).to have_current_path(new_group_exchange_path(@category))
  end

  it 'should be able to save exchange' do
    click_on 'test1'
    click_link 'New Exchange'
    fill_in 'Exchange Name', with: 'exchange'
    fill_in 'Amount', with: 5
    select 'test1'
    click_button 'Create'
    click_on 'test1'
    expect(page).to have_content('exchange')
  end
end
