class Level < ActiveRecord::Base

  has_many :students,:dependent => :destroy
  has_many :results,:dependent => :destroy

end
