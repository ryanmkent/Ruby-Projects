require 'test_helper'

class SalutationsControllerTest < ActionController::TestCase
  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get say_Hello" do
    get :say_Hello
    assert_response :success
  end

  test "should get say_Hello_Joe" do
    get :say_Hello_Joe
    assert_response :success
  end

end
