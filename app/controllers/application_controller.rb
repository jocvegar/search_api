class ApplicationController < ActionController::API
  def index
    render json: "Hello there!"
  end
end
