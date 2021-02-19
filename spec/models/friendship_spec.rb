# == Schema Information
#
# Table name: friendships
#
#  id           :bigint           not null, primary key
#  status       :string           default("pending"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  receiver_id  :integer          not null
#  requester_id :integer          not null
#
# Indexes
#
#  index_friendships_on_receiver_id                   (receiver_id)
#  index_friendships_on_requester_id                  (requester_id)
#  index_friendships_on_requester_id_and_receiver_id  (requester_id,receiver_id) UNIQUE
#
require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject(:friendship) { build(:friendship) }

  describe 'associations' do
    it { should belong_to(:receiver).class_name('User') }

    it { should belong_to(:requester).class_name('User') }
  end

  describe 'validations' do
    it { should define_enum_for(:status).with_values(accepted: 'accepted', pending: 'pending').backed_by_column_of_type(:string) }
  end
end
