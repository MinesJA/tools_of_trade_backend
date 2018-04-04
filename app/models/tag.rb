class Tag < ApplicationRecord
  has_many :tag_tools
  has_many :tools, through: :tag_tools


  


end
