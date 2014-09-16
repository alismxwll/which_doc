def log_in(user)
  visit 'login'
  fill_in :email, with: "Jane@doe.com"
  fill_in :password, with: "HarryIsBigfoot"
  click_on "Enter"
end
