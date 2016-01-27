class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :title, presence: true
  validates :status, inclusion: { in: %w(complete incomplete) }
end
