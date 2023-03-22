require 'rails_helper'

RSpec.describe 'Splash page', type: :feature do
  before :each do
    visit splash_index_path
  end

  it 'I can see the button in splash screen' do
    expect(page).to have_link 'LOG IN'
    expect(page).to have_link 'SIGN UP'
    expect(page).to have_selector 'h1'
  end

  it 'should be able to see login page' do
    click_on 'LOG IN'
    expect(page).to have_current_path new_user_session_path
  end

  it 'should be able to see sign up page' do
    click_on 'SIGN UP'
    expect(page).to have_current_path new_user_registration_path
  end
end