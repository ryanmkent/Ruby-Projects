require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  test "should get name" do
    get :name
    assert_response :success
  end

  test "should get location" do
    get :location
    assert_response :success
  end

  test "should get language" do
    get :language
    assert_response :success
  end

  test "should get comment" do
    get :comment
    assert_response :success
  end

end
