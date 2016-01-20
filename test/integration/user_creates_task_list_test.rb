require 'test_helper'

class UserCreatesTaskListTest < ActionDispatch::IntegrationTest

  test "task list is created" do
    assert_equal TaskList.count, 0

    user = User.create(email: "chris@example.com", password: "password")
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"
    fill_in "Title", with: "Testing"
    fill_in "Description", with: "Better Work"
    click_button "Create New Task List"

    assert_equal TaskList.count, 1
    assert_equal task_lists_path, current_path
    assert page.has_content?("Testing")
    assert page.has_content?("Better Work")
    assert page.has_content?("Task List Successfully Created!")
  end

  test "title can't be blank" do
    assert_equal TaskList.count, 0

    user = User.create(email: "chris@example.com", password: "password")
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"
    fill_in "Description", with: "Better Work"
    click_button "Create New Task List"

    assert_equal TaskList.count, 0
    assert_equal task_lists_path, current_path
    assert page.has_content?("Title can't be blank")
  end
end
