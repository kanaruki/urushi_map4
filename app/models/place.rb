class Place < ApplicationRecord
  attachment :image
  belongs_to :end_user
  belongs_to :group
  validates :place_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
