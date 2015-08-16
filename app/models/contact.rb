class Contact < ActiveRecord::Base
  validates :name, :body,  presence: true
end
