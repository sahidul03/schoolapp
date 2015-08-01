class Event < ActiveRecord::Base
  validates :title,  presence: true
  mount_uploader :image, EventPhotoUploader
end
