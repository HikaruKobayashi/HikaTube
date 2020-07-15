require 'rails_helper'

RSpec.describe "Youtubeについて", type: :request do
  describe 'youtube#index' do
    it 'indexを表示に成功' do
      get youtube_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'youtube#profile' do
    it 'profileを表示に成功' do
      get profile_path
      expect(response).to have_http_status(200)
    end
  end
end