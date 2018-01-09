require "test_helper"

module Supervisor
  class CourseSubjectsControllerTest < ActionDispatch::IntegrationTest
    test "should get create" do
      get supervisor_course_subjects_create_url
      assert_response :success
    end

    test "should get destroy" do
      get supervisor_course_subjects_destroy_url
      assert_response :success
    end
  end
end
