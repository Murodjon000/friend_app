require 'rails_helper'

RSpec.describe 'Actions', type: :feature do
    it 'should send friend request' do
        user = create(:user)
        create(:user)

        feature_sign_in(user)
        visit users_path
        click_button 'Follow'

        expect(page).to have_text('Invitation send to friend request')
    end

    it 'should accept friend request' do
        user = create(:user)
        user_2 = create(:user)
        user_2.send_friend_request_to(user)

        feature_sign_in(user)
        visit users_path
        click_button 'Accept'

        expect(page).to have_text('Invitation accepted')
    end

    it 'should able to reject friend request' do
        user = create(:user)
        user_2 = create(:user)
        user_2.send_friend_request_to(user)

        feature_sign_in(user)
        visit users_path
        click_button 'Reject'

        expect(page).to have_text('Invitation rejected')
    end

    it 'should able to cancel friend request' do
        user = create(:user)
        user_2 = create(:user)
        user_2.send_friend_request_to(user)

        feature_sign_in(user_2)
        visit users_path
        click_button 'Cancel'

        expect(page).to have_text('Invitation rejected')
    end

    it 'should able to remove friend request' do
        user = create(:user)
        user_2 = create(:user)
        user_2.send_friend_request_to(user)
        user.accept_friend_request(user_2)

        feature_sign_in(user)
        visit users_path
        click_button 'Unfollow'

        expect(page).to have_text('Invitation rejected')
    end

end