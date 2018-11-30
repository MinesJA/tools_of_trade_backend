class Tool < ApplicationRecord
  has_many :user_tools
  has_many :users, through: :user_tools

  has_many :tag_tools
  has_many :tags, through: :tag_tools

  validates :name, {presence: true, uniqueness: true, length: { maximum: 20 }}
  validates :description, {presence: true, length: {:in => 5..500}}
  validates :url, presence: true


  # can likely use "scope" for some of these queries


  # Look into creating services folder. Check out:
  # https://github.com/18F/dolores-landingham-slack-bot/tree/develop/app/services


  def self.index(limit:, page: 0)
    self.order("upvotes - downvotes" => :desc).limit(limit).offset((page*limit).abs)

    # Should also include everything that comes with serializer

    # ActiveRecord::Base.connection.execute("sql statement")
    # Right query, but does not show the calculated populariy column

    # SELECT * FROM tools ORDER BY ROUND(upvotes - downvotes) DESC LIMIT ABS(page * limit), limit;

    # Shows caclculated popularity column
    # SELECT *, ROUND(Upvotes - Downvotes) AS popularity FROM tools ORDER BY popularity DESC LIMIT ABS(page * limit), limit
  end




  def self.order_popularity
    # popularity = upvotes - downvotes

  end

  def limit_offset

  end


  def author
    UserTool.find_by(tool_id: self.id, author: true).user
  end




  def self.tools_from_tags(tag_string)
    # need to find sql query that returns all rows of Tools that have ALL tag instances sent in. Exclusive

    # This will give me an array of arrays of tools, each array cooresponds to a return from a different tags tools.
    # array_of_arrays_tools = tags_array.map do |tag|
    #     Tool.joins(:tags).where({tags: {name: tag}})
    # end

    tags_array = tag_string.split(",")

    tags = Tag.where(name: tags_array)

    array_all_tools = Tool.joins(:tags).where({tags: {name: tags_array}})

    array_all_tools.select {|tool| (tool.tags & tags).count == tags.count}.uniq
  end


  def self.tools_from_search_term(search_term)
    # Tool.where("name ~* ?", search_term)
    Tool.where("lower(name || '' || description) LIKE ?", "%#{search_term.downcase}%")
  end


  def self.tools_from_tags_search_term(tag_string, search_term)
    tools = self.tools_from_tags(tag_string)

    tools.select do |tool|
      tool.name.downcase.include?(search_term) ||
      tool.description.downcase.include?(search_term)
    end
  end


end
