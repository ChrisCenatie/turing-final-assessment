require 'test_helper'

class UserEditsListTest < ActionDispatch::IntegrationTest

  test "edits task list title" do
    user = User.create(email: "chris@example.com", password: "password")
    task_list = TaskList.create(title: "Testing", description: "Testing Edit")
    user.task_lists << task_list

    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Title: Testing")
    click_link "Edit Task List"

    assert_equal task_list_path(task_list), current_path

    fill_in "Title", with: "Editing Title"
    click_button "Update Task Title"

    assert_equal task_lists_path, current_path
    assert page.has_content?("Task List Successfully Updated!")
    assert_equal TaskList.last.title, "Editing Title"
  end

  test "edit title can't be blank" do
    user = User.create(email: "chris@example.com", password: "password")
    task_list = TaskList.create(title: "Testing", description: "Testing Edit")
    user.task_lists << task_list

    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"
    assert page.has_content?("Title: Testing")
    click_link "Edit Task List"

    assert_equal task_list_path(task_list), current_path

    click_button "Update Task Title"

    assert_equal task_list_path(task_list), current_path
    assert page.has_content?("Title can't be blank")
    assert_equal TaskList.last.title, "Testing"
  end
end
