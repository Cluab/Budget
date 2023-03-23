require 'rails_helper'

RSpec.describe 'Log In page', type: :feature do
  before :each do
    @user1 = User.create(name: 'George', email: 'george@gmail.com', password: '123456')
    visit new_user_session_path
  end

  it 'I can see the input in login page' do
    expect(page).to have_field 'Email'
    expect(page).to have_field 'Password'
    expect(page).to have_button 'Log in'
  end

  it 'should be able to see authenticated route' do
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    expect(page).to have_content('Log out')
  end

  it "shouldn't be able to enter to root route" do
    fill_in 'Email', with: 'usertest@gmail.com'
    fill_in 'Password', with: '456789'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
