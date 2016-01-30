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

  test "task due date cannot be in the past" do
    current_date = Date.today
    valid_task = Task.new(title: "Testing", due_date: current_date)
    invalid_task = Task.new(title: "Testing", due_date: Date.new(2001, 10, 28))

    assert valid_task.save
    refute invalid_task.save
    assert_equal valid_task.due_date, current_date
    assert_equal invalid_task.errors.messages[:due_date][0], "Due date can't be in the past"
  end

  test "task start date cannot be in the past" do
    current_date = Date.today
    valid_task = Task.new(title: "Testing", start_date: current_date)
    invalid_task = Task.new(title: "Testing", start_date: Date.new(2001, 10, 28))

    assert valid_task.save
    refute invalid_task.save
    assert_equal valid_task.start_date, current_date
    assert_equal invalid_task.errors.messages[:start_date][0], "Start date can't be in the past"
  end
end
