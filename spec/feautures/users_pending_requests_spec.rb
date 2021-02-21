require 'rails_helper'

RSpec.describe 'UsersPendingRequests', type: :feature do
    it 'should list all users that have pending request of user' do
        user = create(:user)
        user_2 = create(:user)
        user_2.send_friend_request_to(user)
        feature_sign_in(user)
        visit users_path

        expect(page).to have_text(user_2.name)
    end

    it 'should show user`s show page' do
        user = create(:user)
        feature_sign_in(user)
        visit users_path

        expect(page).to have_link(user.name, href: user_path(user))
    end
end