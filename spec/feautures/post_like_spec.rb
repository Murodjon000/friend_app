require 'rails_helper'

RSpec.describe 'PostLikes', type: :feature do

    
    it 'should like the post if post is unliked' do
        user = create(:user)
        create(:post, user: user)
        feature_sign_in(user)

        visit posts_path
        click_link 'Like!'

        expect(page).to have_text('You liked the post')
    end

    it 'should dislike the post if post is liked' do
        user = create(:user)
        content = create(:post, user: user)
        create(:like,post: content, user: user)
        feature_sign_in(user)

        visit posts_path
        click_link 'Dislike!'

        expect(page).to have_text('You disliked the post')
    end
end