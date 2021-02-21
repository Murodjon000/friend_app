require 'rails_helper'

RSpec.describe "Friednships", type: :request do
    describe '#create' do
        it 'should create friend request' do
            user = create(:user)
            user_2 = create(:user)
            sign_in(user)
            
            post user_friendships_path(user_2), params: nil

            expect(user_2.receivers.count).to eq(1)

        end
    end

    describe '#update' do
        it 'should accept friend request' do
            user = create(:user)
            user_2 = create(:user)
            user_2.send_friend_request_to(user)
            sign_in(user)
            
            patch user_friendships_path(user_2), params: nil

            expect(user.friend?(user_2)).to be_truthy

        end
    end

    describe '#destroy' do
        it 'should delet friend request' do
            user = create(:user)
            user_2 = create(:user)
            user_2.send_friend_request_to(user)
            user.accept_friend_request(user_2)
            sign_in(user)
            
            delete user_friendships_path(user_2)

            expect(user.requesters.count).to be_zero

        end
    end
end
