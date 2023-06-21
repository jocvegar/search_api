require 'rails_helper'

RSpec.describe Api::V1::MediaSearchController, type: :controller do
  describe "#query" do
    context "with a valid query and media_type" do
      it "returns a JSON response" do
        get :query, params: { query: "example", media_type: "movie" }
        expect(response).to have_http_status(:ok)
      end
    end

    context "with an empty query" do
      it "returns a JSON response indicating to input search term" do
        get :query, params: { query: "", media_type: "movie" }
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq("Please input search term")
      end
    end

    context "with an invalid media_type" do
      it "returns a JSON response indicating the allowed media types" do
        get :query, params: { query: "example", media_type: "invalid" }
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq("allowed media types are: movie, person, network, and review")
      end
    end
  end

  describe "#missing_query" do
    it "returns a JSON response indicating to input search term" do
      get :missing_query, params: { media_type: "movie" }
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq("Please input search term")
    end
  end
end
