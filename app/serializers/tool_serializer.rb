class ToolSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :upvotes, :downvotes, :saves, :author
  has_many :tags

  def saves
    UserTool.where(tool_id: object.id, author: false).length
  end

  def author
    object.author
  end




end
