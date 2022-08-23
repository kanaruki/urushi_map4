class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  # mount_uploader :image, ImageUploader
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :places

  # validates :name, presence: true
  # validates :introduction, presence: true
  # validates :image_id, presence: true
  # validates :is_deleted, presence: true
  validates :email, presence: true
end
