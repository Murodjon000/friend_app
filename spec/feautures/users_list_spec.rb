require 'rails_helper'

RSpec.describe 'Userslist', type: :feature do
    it 'should list all users' do
        user = create(:user)
        feature_sign_in(user)
        visit users_path

        expect(page).to have_text(user.name)
    end

    it 'should show user`s show page' do
        user = create(:user)
        feature_sign_in(user)
        visit users_path

        expect(page).to have_link(user.name, href: user_path(user))
    end
end