class ContactShare < ActiveRecord::Base
  validates :user_id, presence: true
  validates :contact_id, presence: true, uniqueness: { scope: :user_id }
  validate :no_sharing_with_owner

  belongs_to :contact

  belongs_to :recipient,
  foreign_key: :user_id,
  class_name: 'User'

  def no_sharing_with_owner
    if self.user_id == Contact.find_by(id: self.contact_id).owner.id
      self.errors[:contact] << "can't be shared with its owner"
    end
  end

end
