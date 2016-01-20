require 'test_helper'

class UserDeletesTaskListTest < ActionDispatch::IntegrationTest

  test "user deletes task list" do
    user = User.create(email: "chris@example.com", password: "password")
    task_list = TaskList.create(title: "Testing", description: "Testing Edit")
    user.task_lists << task_list

    assert_equal user.task_lists.count, 1

    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Title: Testing")
    click_link "Delete Task List"

    assert_equal task_lists_path, current_path
    assert_equal user.task_lists.count, 0
  end
end
