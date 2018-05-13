class Tag < ApplicationRecord
  has_many :tag_tools
  has_many :tools, through: :tag_tools

  validates :name, uniqueness: true


  def self.process_tag_strings(tag_strings, tool)
    @errors = []

    tag_strings.each do |tag_string|
      tag = Tag.find_or_create_by(name: tag_string)
      if tag.valid?
        tool.tags << tag
      else
        @errors << tag
      end
    end
    
    @errors
  end



end
