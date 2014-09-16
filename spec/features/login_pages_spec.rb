require 'rails_helper'

describe 'the login process' do
  it 'logs in a user' do
    user = FactoryGirl.create(:user)
    visit 'login'
    fill_in :email, with: "Jane@doe.com"
    fill_in :password, with: "HarryIsBigfoot"
    click_on "Enter"
    expect(page).to have_content "Logged in!"
  end

it 'fails a log in for user due to wrong pw' do
    user = FactoryGirl.create(:user)
    visit 'login'
    fill_in :email, with: "Jane@doe.com"
    fill_in :password, with: "WrongPW"
    click_on "Enter"
    expect(page).to have_content "Email Password Email or password is invalid"
  end
end
