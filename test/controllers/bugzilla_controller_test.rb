require "test_helper"

class BugzillaControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get bugzilla_home_url
    assert_response :success
  end

  test "should get help" do
    get bugzilla_help_url
    assert_response :success
  end
end
