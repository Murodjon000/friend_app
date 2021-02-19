# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { build(:comment) }

  describe 'associations' do
    it { should belong_to(:post) }

    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_length_of(:content).is_at_most(200).with_message('200 characters in comment is the maximum allowed.') } # rubocop:disable Layout/LineLength
  end
end
