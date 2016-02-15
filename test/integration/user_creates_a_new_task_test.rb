require 'test_helper'

class UserCreatesTaskTest < ActionDispatch::IntegrationTest

  test "task is created" do
    create_user
    create_user_task_list
    sign_user_in

    assert_equal User.last.tasks.count, 0
    click_link "Add A Task"

    assert_equal new_task_list_task_path(TaskList.last.id), current_path

    fill_in "Title", with: "Task 1"
    select "complete", from: "Status"
    fill_in "Notes", with: "Testing notes"
    click_button "Create Task"
    assert_equal current_path, task_lists_path

    assert_equal User.last.tasks.count, 1
    assert_equal User.last.tasks.first.title, "Task 1"
    assert_equal User.last.tasks.first.status, "complete"
    assert_equal User.last.tasks.first.notes, "Testing notes"
  end
end
