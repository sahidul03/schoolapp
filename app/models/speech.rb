class Speech < ActiveRecord::Base
  validates :title,  presence: true
  mount_uploader :image, SpeechPhotoUploader
end
