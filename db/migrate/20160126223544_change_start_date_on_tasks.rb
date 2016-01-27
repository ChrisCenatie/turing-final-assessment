class ChangeStartDateOnTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :start_date, 'date USING CAST(start_date AS date)'
  end
end
