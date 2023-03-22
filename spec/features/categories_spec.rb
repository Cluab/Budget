require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  before :each do
    @user1 = create(:user, email: 'cluab@test.com', password: '123456')
    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  it 'should be able to see Logout option' do
    expect(page).to have_content('Log out')
  end

  it 'should be able to redirect to add new category' do
    click_link 'New Category'
    expect(page).to have_current_path(new_group_path)
  end

  it 'should be able to save category' do
    click_link 'New Category'
    fill_in 'Category Name', with: 'test'
    fill_in 'IconURL', with: 'url'
    click_button 'Create'
    expect(page).to have_content('test')
  end
end
