class Routine < ActiveRecord::Base
  validates :title,  presence: true
  mount_uploader :file, RoutineFileUploader
end
