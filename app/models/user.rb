class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts

  has_many :received_shares,
  foreign_key: :user_id,
  class_name: 'ContactShare'

  has_many :received_contacts,
  through: :received_shares,
  source: :contact

end
