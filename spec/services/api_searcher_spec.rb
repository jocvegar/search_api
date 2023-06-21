require 'rails_helper'
require 'vcr'

RSpec.describe ApiSearcher do
  describe "#get_media" do
    let(:api_searcher) { ApiSearcher.new }

    it "returns serialized media data for movies" do
      VCR.use_cassette("api_searcher_get_media") do
        media_type = "movie"
        query = "bumblebee"
        result = api_searcher.get_media(media_type, query)
        expected_result = {:id=>424783, :title=>"Bumblebee", :overview=>"On the run in the year 1987, Bumblebee finds refuge in a junkyard in a small Californian beach town. Charlie, on the cusp of turning 18 and trying to find her place in the world, discovers Bumblebee, battle-scarred and broken.  When Charlie revives him, she quickly learns this is no ordinary yellow VW bug.", :poster_path=>"https://image.tmdb.org/t/p/w500/fw02ONlDhrYjTSZV8XO6hhU3ds3.jpg"}
        expect(result[0]).to eq expected_result
        # testing serialized response
        result.each do |movie|
          expect(movie).to include(:id, :title, :overview, :poster_path)
        end
      end
    end

    it "returns empty array for unknown media type" do
      VCR.use_cassette("api_searcher_get_media_unknown") do
        media_type = "unknown"
        query = "example"
        result = api_searcher.get_media(media_type, query)
        expect(result).to be_empty
      end
    end
  end
end
