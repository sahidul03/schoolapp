class Committee < ActiveRecord::Base
  validates :name,  presence: true
  mount_uploader :profile_photo, CommitteeProfilePhotoUploader
end
