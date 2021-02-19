# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { build(:post) }

  describe 'associations' do
    it { should belong_to(:user) }

    it { should have_many(:comments) }

    it { should have_many(:likes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }

    it { should validate_length_of(:content).is_at_most(1000).with_message('1000 characters in post is the maximum allowed.') } # rubocop:disable Layout/LineLength
  end
end
