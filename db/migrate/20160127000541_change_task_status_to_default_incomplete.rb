class ChangeTaskStatusToDefaultIncomplete < ActiveRecord::Migration
  def change
    change_column :tasks, :status, :string, default: "incomplete"
  end
end
