def log_in(user)
  visit 'login'
  fill_in :email, with: user.email
  fill_in :password, with: user.password
  click_on "Enter"
end
