require "test_helper"

class OrdersBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get orders_books_create_url
    assert_response :success
  end

  test "should get update" do
    get orders_books_update_url
    assert_response :success
  end

  test "should get destroy" do
    get orders_books_destroy_url
    assert_response :success
  end
end
