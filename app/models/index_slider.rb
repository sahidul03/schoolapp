class IndexSlider < ActiveRecord::Base
  validates :title, :image,  presence: true
  mount_uploader :image, IndexSliderImageUploader
end
