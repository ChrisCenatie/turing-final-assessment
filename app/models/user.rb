class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :task_lists
  has_many :tasks, through: :task_lists
end
