require 'rails_helper'

describe 'the question process' do
  it 'asks a question' do
    user = FactoryGirl.create(:user)
    log_in(user)
    visit 'questions/new'
    fill_in :question_title, with: 'Bowel Issues'
    fill_in :question_content, with: 'Very descriptive explaination of what is happening during...'
    click_on "Create Question"
    expect(page).to have_content "Question Added."
  end
end
