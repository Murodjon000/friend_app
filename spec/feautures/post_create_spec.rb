require 'rails_helper'

RSpec.describe 'PostCreate', type: :feature do
    it 'should redirect to root_path after post created' do
        user = create(:user)
        feature_sign_in(user)
        visit root_path
        fill_in 'Content', with: 'Hello guys'
        click_button 'Post'

        expect(page).to have_current_path(posts_path)
    end
end