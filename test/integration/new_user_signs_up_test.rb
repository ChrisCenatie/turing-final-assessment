require 'test_helper'

class UserSignsUpTest < ActionDispatch::IntegrationTest

  test "User successfully signs up" do
    old_user_count = User.count
    visit login_path
    click_link "Sign Up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Create Account"

    assert_equal task_lists_path, current_path
    assert_equal old_user_count + 1, User.count
  end

  test "User email is already taken" do
    user = User.create(email: "test@example.com", password: "password")
    old_user_count = User.count
    visit '/users/new'

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirmation", with: "password"
    click_button "Create Account"

    assert_equal '/users', current_path
    assert page.has_content?("Email has already been taken")
    assert_equal old_user_count, User.count
  end

  test "User doesn't enter a password" do
    old_user_count = User.count
    visit '/users/new'

    fill_in "Email", with: "test@example.com"
    click_button "Create Account"

    assert_equal '/users', current_path
    assert page.has_content?("Password can't be blank")
    assert_equal old_user_count, User.count
  end

  test "User password and confirmation does not match" do
    old_user_count = User.count
    visit '/users/new'

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password1"
    fill_in "Confirmation", with: "password"
    click_button "Create Account"

    assert_equal '/users', current_path
    assert page.has_content?("Confirmation does not match password")
    assert_equal old_user_count, User.count
  end
end
