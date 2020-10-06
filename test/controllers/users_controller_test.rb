require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get search result" do
    get books_path
    get books_search_path, params: { keyword: "yuna", user_book: "1", how: "1" }
    assert_template "books/search"
    assert_select "td", count: 1
  end
end
