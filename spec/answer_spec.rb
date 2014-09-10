require 'rails_helper'

describe Answer do
  it { should validate_presence_of :question_id }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :content }

end
