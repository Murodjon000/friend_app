require 'rails_helper'

RSpec.describe 'UsersPendingRequests', type: :feature do
    it 'should list all users that have pending request of user' do
        user = create(:user)
        user_2 = create(:user, name: 'John')
        user_2.send_friend_request_to(user)
        feature_sign_in(user)
        visit user_path(user)

        expect(page).to have_text(user_2.name)
    end
end