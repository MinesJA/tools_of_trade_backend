class Tool < ApplicationRecord
  belongs_to :user
  has_many :tag_tools
  has_many :tags, through: :tag_tools

end
