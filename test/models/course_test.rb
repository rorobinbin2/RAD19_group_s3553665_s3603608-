require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @course = Course.new(name:"Subject_1", prerequisite:"Testing", category:"category1",
    location:"location1",user_id: @user.id)
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "user id should be present" do
    @course.user_id = nil
    assert_not @course.valid?
  end
end
