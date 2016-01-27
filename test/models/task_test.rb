require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "task must have a title" do
    valid_task = Task.new(title: "Testing")
    invalid_task = Task.new(notes: "invalid")

    assert valid_task.valid?
    refute invalid_task.valid?
  end

  test "task status can only be set as incomplete or complete" do
    task_1 = Task.new(title: "Testing", status: "complete")
    task_2 = Task.new(title: "Testing", status: "incomplete")
    task_3 = Task.new(title: "Testing", status: "invalid")
    
    assert task_1.save
    assert task_2.save
    refute task_3.save
    assert_equal task_1.status, "complete"
    assert_equal task_2.status, "incomplete"
  end
end
