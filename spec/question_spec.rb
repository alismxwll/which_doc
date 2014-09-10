require 'rails_helper'

describe Question do
  # it {should belong_to :user}
  it {should validate_presence_of :content}
end
