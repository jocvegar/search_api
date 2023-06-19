require "test_helper"

class TestTest < ActiveSupport::TestCase
  setup do
    @test = create(:test)
  end

  test "validations" do
    @test = build(:test, name: nil)
    assert_not @test.valid?

    @test = build(:test, age: "eight")
    assert_not @test.valid?

    @test = build(:test)
    assert @test.valid?
  end
end
