class Prototype < ApplicationRecord
  # belongs_to :catch_copy
  # belongs_to :concept
  has_many :comments
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

end
