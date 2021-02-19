# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_likes_on_post_id  (post_id)
#  index_likes_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) { build(:like) }

  describe 'associations' do
    it { should belong_to(:post) }

    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end
end
