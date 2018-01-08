require "test_helper"

module Supervisor
  class SubjectsControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
      get supervisor_subjects_index_url
      assert_response :success
    end
  end
end
