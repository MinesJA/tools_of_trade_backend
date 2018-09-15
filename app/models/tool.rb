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
    # need to find sql query that returns all rows of Tools that have ALL tag instances sent in. Exclusive
    # Having a little trouble with an ActiveRecord Query and was wondering if anyone had any ideas. I have a many-to-many between Tools and Tags. Given x unique tag names, is there a query I can run that will give me all the tools that have a relationship to each matching tag (not any matching tag).
    #
    # In other words, running @tag.tools for each tag will give me an AR collection of tools but I only want the tools that exist in each collection. So I guess Exclusive not Inclusive.
    #
    # Discovered that this `Tool.joins(:tags).where({tags: {name: ["tag_name", "different_tag_name"}})` will give me every tool that has a relationship to any of the tags. Does anyone know how to make that return tools that have a relationship to all of the tags?

    # SELECT  "tools".* FROM "tools" INNER JOIN "tag_tools" ON "tag_tools"."tool_id" = "tools"."id" INNER JOIN "tags" ON "tags"."id" = "tag_tools"."tag_id" WHERE "tags"."name" = $1 LIMIT $2  [["name", "fonts"], ["LIMIT", 11]]
    # [#<Tool id: 249, name: "Font Pair", description: "Font Pair is a great tool that lets your pair Goog...", url: "https://fontpair.co/", upvotes: 0, downvotes: 0, created_at: "2018-09-05 23:41:20", updated_at: "2018-09-05 23:41:20">, #<Tool id: 250, name: "Typ.io", description: "A really rich and cool font discovery tool. Typ.io...", url: "http://typ.io/", upvotes: 0, downvotes: 0, created_at: "2018-09-05 23:41:20", updated_at: "2018-09-05 23:41:20">]>

    # Tag.where(name: tags_array).map do |tag|
    #   tag.tools
    # end.flatten.uniq


    #
    # array_of_arrays_tools = tags_array.map do |tag|
    #     Tool.joins(:tags).where({tags: {name: tag}})
    # end
    #
    # tools = []
    #
    # array_of_arrays_tools.each do |array|
    #   tools.push(array & nextArray)
    #
    #
    # end
    #
    # array_all_tools = Tool.joins(:tags).where({tags: {name: tags_array}})
    # byebug
    # array_all_tools.collect do |tool|
    #   byebug
    #   array_all_tools.count(tool) == tags_array.count
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
