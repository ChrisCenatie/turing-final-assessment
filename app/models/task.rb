class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :title, presence: true
  validates :status, inclusion: { in: %w(complete incomplete) }
  validate :due_date_cannot_be_in_the_past, :start_date_cannot_be_in_the_past

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "Due date can't be in the past")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Start date can't be in the past")
    end
  end
end
