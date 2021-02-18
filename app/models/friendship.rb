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
class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  enum status: { accepted: 'accepted', pending: 'pending' }
end
