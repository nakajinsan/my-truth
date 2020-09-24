class Photo < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :nated_food, presence: true
  validates :dislike_word, presence: true
  validates :hate_human, presence: true
  validates :weaknes, presence: true
  validates :remark, presence: true
  mount_uploader :image, ImageUploader

end
