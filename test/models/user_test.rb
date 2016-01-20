require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    assert User.create(email: 'chris@example.com', password: 'password')
    refute User.new(email: 'chris@example.com', password: 'password2').valid?
  end
end
