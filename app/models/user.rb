class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  # has_many :task_lists, for future reference when lists are added to application 
end
