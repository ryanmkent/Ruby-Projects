require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get display" do
    get :display
    assert_response :success
  end

end