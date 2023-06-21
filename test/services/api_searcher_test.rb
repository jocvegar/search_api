require 'test_helper'

class ApiSearcherTest < ActiveSupport::TestCase
  setup do
    @service = ApiSearcher.new
  end

  test 'it calls get movies' do
    query = "batman"
    response = @service.get_media(query)
    assert_not_empty(response)
  end
end
