require "test_helper"

class Api::V1::MovieSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get api_v1_media_search_path, params: { media_type: "movie", query: "test"}
    assert_response :success
  end

  # test "should ask for a query param" do
  #   get api_v1_path, params: { q: ""}
  #   assert_equal(response.body, "Please input search term")
  # end
end
