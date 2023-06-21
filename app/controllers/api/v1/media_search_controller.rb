class Api::V1::MediaSearchController < ApplicationController
  before_action :validate_media_type

  def query
    query = params["query"]
    media_type = params["media_type"]

    if query.present?
      searcher = ApiSearcher.new.get_media(media_type, query.parameterize)
      render json: searcher
    else
      render json: "Please input search term"
    end
  end

  def missing_query
    render json: "Please input search term"
  end


  private

  def validate_media_type
    media_type = params["media_type"]
    allowed_media_types = [ "movie", "person", "network", "review" ]

    unless allowed_media_types.include?(media_type)
      return render json: "allowed media types are: movie, person, network, and review"
    end

  end
end
