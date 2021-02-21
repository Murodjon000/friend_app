require 'rails_helper'

RSpec.describe "Posts", type: :request do

  describe '#create' do
    let(:user) { create(:user) }

    before { sign_in(user) }

    it 'should create post' do        
        post posts_path, params: { post: { content: 'This is post' } }

        expect(user.posts.count).to eq(1)
    end
  end
end
