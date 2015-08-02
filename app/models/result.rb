class Result < ActiveRecord::Base
  validates :title, :level_id,  presence: true
  mount_uploader :file, ResultFileUploader
  belongs_to :level
end
