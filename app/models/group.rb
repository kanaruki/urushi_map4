class Group < ApplicationRecord
  attachment :image

  has_many :group_users
  has_many :end_users, through: :group_users
  has_many :places
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
end
