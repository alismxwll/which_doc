FactoryGirl.define do
  factory(:user) do
    username('Jane')
    email('Jane@doe.com')
    password('HarryIsBigfoot')
    password_confirmation('HarryIsBigfoot')
  end

end
