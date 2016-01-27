class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :status, default: false
      t.text :notes
      t.date :due_date
      t.string :start_date
      t.references :task_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
