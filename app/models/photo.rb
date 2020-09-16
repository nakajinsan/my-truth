class Photo < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :image, presence: true, unless: :name?
  mount_uploader :image, ImageUploader

end
