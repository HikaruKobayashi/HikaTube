require 'rails_helper'

RSpec.describe "Lines", type: :request do
  describe 'GET /youtube#index' do
    it 'トップページの表示に成功する。' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

end
