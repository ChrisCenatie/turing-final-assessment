require 'test_helper'

class TaskListTest < ActiveSupport::TestCase
  test "task list title is required" do
    task_list = TaskList.new(description: "Testing validation")
    valid_task_list = TaskList.new(title: "Valid", description: "Testing validation")

    refute task_list.valid?
    assert valid_task_list.valid?
  end

  test "task list belongs to a user" do
    user = User.create(email: "testing@example.com", password: "password")
    task_list = TaskList.create(title: "Valid", description: "Testing validation")
    user.task_lists << task_list

    assert_equal user.task_lists.first, task_list
  end
end
