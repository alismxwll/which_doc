require 'rails_helper'

describe 'the signup process' do
  it 'signs up a user with username, email and password' do
    visit 'signup'
    fill_in :user_username, with: 'MyName'
    fill_in :user_email, with: 'MyEmail@Email.com'
    fill_in :user_password, with: 'SuperHardPW'
    fill_in :user_password_confirmation, with: 'SuperHardPW'
    click_button "Sign Up"
    expect(page).to have_content "Thank you for signing up!"
  end

  it 'does not sign up a user with username, email and password due to failed password' do
    visit 'signup'
    fill_in :user_username, with: 'MyName'
    fill_in :user_email, with: 'MyEmail@Email.com'
    fill_in :user_password, with: 'SuperHardPW'
    fill_in :user_password_confirmation, with: 'WrongPW'
    click_button "Sign Up"
    expect(page).to have_content "No Bueno"
  end
end
