class ApiSearcher
  def initialize
    @api_key = ENV["API_KEY"]
    @base_uri = "https://api.themoviedb.org/3"
    @options = {query: { api_key: @api_key }}
  end

  def get_media(media_type, query)
    response = HTTParty.get("#{@base_uri}/search/#{media_type}?query=#{query}", @options)
    response.nil? ? [] : serialize_data(media_type, response)
  end

  def serialize_data(media_type, response)
    result = []
    case media_type
    when "movie"
      response["results"].each do |movie|
        result << {
          id: movie["id"],
          title: movie["title"],
          overview: movie["overview"],
          poster_path: movie["poster_path"].nil? ? "" : "https://image.tmdb.org/t/p/w500" + movie["poster_path"],
        }
      end
      result
    # when "set serializer for other media types"
    else
      result
    end
  end
end
