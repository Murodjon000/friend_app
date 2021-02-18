# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gravatar_url           :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :active_friendships, class_name: 'Friendship', foreign_key: :requester_id, dependent: :destroy
  has_many :requesters, through: :active_friendships, source: :receiver

  has_many :passive_friendships, class_name: 'Friendship', foreign_key: :receiver_id, dependent: :destroy
  has_many :receivers, through: :passive_friendships, source: :requester

  def send_friend_request_to(user)
    active_friendships.create(receiver_id: user.id)
  end

  def accept_friend_request(user)
    friend_request = passive_friendships.find_by(requester_id: user.id)
    friend_request.accepted!
  end

  def delete_friend_request(user)
    friend_request = Friendship.find_by(requester: user, receiver: self) ||
                     Friendship.find_by(requester: self, receiver: user)
    friend_request.destroy
  end

  def friends
    friend_list = active_friendships.map { |f| f.receiver if f.accepted? }
    friend_list += passive_friendships.map { |f| f.requester if f.accepted? }
    friend_list.compact
  end

  def pending
    friend_list += passive_friendships.map { |f| f.requester if f.pending? }
    friend_list.compact
  end

  def friend?(user)
    friends.include?(user)
  end

  def mutual_friends(user)
    mutual_friends = friends + user.friends

    mutual_friends.reject do |friend|
      friend.id == user.id || !user.friend?(friend) || !friend?(friend)
    end.uniq
  end

  def friend_request_pending_from?(user)
    Friendship.where(requester: user, receiver: self, status: 'pending').exists?
  end

  def friend_request_pending_to?(user)
    Friendship.where(requester: self, receiver: user, status: 'pending').exists?
  end

  def no_relation?(user)
    !friend?(user) && !friend_request_pending_from?(user) && !friend_request_pending_to?(user)
  end

end
