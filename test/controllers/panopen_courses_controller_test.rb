require "test_helper"

class PanopenCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get list_courses" do
    get panopen_courses_list_courses_url
    assert_response :success
  end

  test "should get list_course_students" do
    get panopen_courses_list_course_students_url
    assert_response :success
  end

  test "should get update_user" do
    get panopen_courses_update_user_url
    assert_response :success
  end
end
