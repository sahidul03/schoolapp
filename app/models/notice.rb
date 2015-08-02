class Notice < ActiveRecord::Base
  validates :title,  presence: true
  mount_uploader :image, NoticePhotoUploader
  mount_uploader :file, NoticefileUploader
end
