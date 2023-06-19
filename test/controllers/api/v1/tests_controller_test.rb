require "test_helper"

class TestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test = create(:test)
  end

  test "should get index" do
    get api_v1_tests_path, as: :json
    assert_response :success
  end

  test "should create test" do
    assert_difference("Test.count") do
      post api_v1_tests_path, params: { test: { age: @test.age, name: @test.name } }, as: :json
    end

    assert_response :created
  end

  test "should show test" do
    get api_v1_test_path(@test), as: :json
    assert_response :success
  end

  test "should update test" do
    patch api_v1_test_path(@test), params: { test: { age: @test.age, name: @test.name } }, as: :json
    assert_response :success
  end

  test "should destroy test" do
    assert_difference("Test.count", -1) do
      delete api_v1_test_path(@test), as: :json
    end

    assert_response :no_content
  end
end
