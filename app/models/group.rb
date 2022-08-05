class Group < ApplicationRecord
  attachment :image

  has_many :group_users
  has_many :end_users, through: :group_users
end
