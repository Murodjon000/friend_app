require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe '#create' do
    it 'should create like to the post' do
        user = create(:user)
        content= create(:post, user: user)

        sign_in(user)
        
        post post_likes_path(content), params: nil

        expect(content.likes.count).to eq(1)

    end
  end

  describe '#destroy' do
    it 'should delete like from the post' do
      user = create(:user)
      content= create(:post, user: user)
      like = create(:like, post: content, user: user)

      sign_in(user)
      
      delete post_like_path(content, like)

      expect(content.likes.count).to be_zero
    end
  end

end
