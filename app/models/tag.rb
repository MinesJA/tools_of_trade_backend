class Tag < ApplicationRecord
  has_many :tag_tools
  has_many :tools, through: :tag_tools

  validates :name, uniqueness: true


  def self.process_tag_strings(tag_strings:, tool:)
    tag_strings.map do |tag_string|
      tag = Tag.find_or_create_by(name: tag_string)
      tool.tags << tag
    end
  end



end
