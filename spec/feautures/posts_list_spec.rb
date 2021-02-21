require 'rails_helper'

RSpec.describe 'PostList', type: :feature do

    
    it 'should list all posts' do
        user = create(:user)
        content = create(:post, user: user)
        feature_sign_in(user)
        visit posts_path

        expect(page).to have_text(content.content)
    end
end