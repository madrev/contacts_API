class Contact < ActiveRecord::Base
  validates :user_id, :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }

  belongs_to :owner,
  foreign_key: :user_id,
  class_name: 'User'

  has_many :contact_shares

  has_many :share_recipients,
  through: :contact_shares,
  source: :recipient
end
