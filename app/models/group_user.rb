class GroupUser < ApplicationRecord
  belongs_to :end_user
  belongs_to :group
  validates :end_user, presence: true
  validates :group, presence: true
end
