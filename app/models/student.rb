class Student < ActiveRecord::Base

  validates :name, :roll_no, :level_id,  presence: true
  mount_uploader :profile_photo, StudentProfilePhotoUploader
  belongs_to :level

end
