class Tool < ApplicationRecord
  has_many :user_tools
  has_many :users, through: :user_tools

  has_many :tag_tools
  has_many :tags, through: :tag_tools

  validates :name, {presence: true, uniqueness: true, length: { maximum: 20 }}
  validates :description, {presence: true, length: {:in => 5..500}}
  validates :url, presence: true


  def author
    UserTool.find_by(tool_id: self.id, author: true).user
  end


  def self.tools_from_tags(tag_string)
    # Need to find .where SQL for: give me all unique tools that have a relationship with any of these tags
    tags_array = tag_string.split(",")

    Tag.where(name: tags_array).map do |tag|
      tag.tools
    end.flatten.uniq
  end


  def self.tools_from_searchterm(searchterm)
    # Tool.where("name ~* ?", searchterm)
    Tool.where("lower(name || '' || description) LIKE ?", "%#{searchterm.downcase}%")
  end


  def self.tools_from_tags_searchterm(tag_string, searchterm)
    tools = self.tools_from_tags(tag_string)

    tools.select do |tool|
      tool.name.downcase.include?(searchTerm) ||
      tool.description.downcase.include?(searchTerm)
    end
  end


end
