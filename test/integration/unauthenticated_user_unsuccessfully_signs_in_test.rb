require 'test_helper'

class UnauthenticatedUserUnsuccessfulLoginTest < ActionDispatch::IntegrationTest

  test "unauthenticated user is redirected to login page after entering an invalid password" do
    user = User.create(email: "chris@example.com", password: "password")

    visit "/login"

    fill_in "Email", with: user.email
    fill_in "Password", with: "passwor"
    click_button "Login"

    assert_equal "/login", current_path
  end

  test "unauthenticated user is redirected to login page after entering an invalid email" do
    user = User.create(email: "chris@example.com", password: "password")
    visit "/login"

    fill_in "Email", with: "wrongemail@example.com"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal "/login", current_path
  end
end
