class Teacher < ActiveRecord::Base
  validates :name,  presence: true
  mount_uploader :profile_photo, TeacherProfilePhotoUploader
end
