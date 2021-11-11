class Album < ApplicationRecord
    validates :name,presence: true
    validates :description,presence: true
    belongs_to :user
    # has_many :photos
    has_many_attached :images
    has_many :comments ,dependent: :destroy
end
