class UsefulLink < ActiveRecord::Base
  validates :title, :link,  presence: true

end
