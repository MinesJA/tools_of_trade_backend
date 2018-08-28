class User < ApplicationRecord
  has_many :user_tools
  has_many :tools, through: :user_tools


  def post_tool(name:, description:, url:, tag_strings:)
    tool = self.tools.create(name: name, description: description, url: url)
    user_tool = UserTool.find_by(user_id: self.id, tool_id: tool.id)
    user_tool.author = true
    user_tool.save

    Tag.process_tag_strings(tag_strings: tag_strings, tool: tool)

    tool
  end

  def save_tool(tool_id:)
    tool = Tool.find(tool_id)
    self.tools << tool
    tool
  end

  def saved_tools
    Tool.includes(:user_tools).where(:user_tools => {user_id: self.id, author: false})
  end

  def posted_tools
    Tool.includes(:user_tools).where(:user_tools => {user_id: self.id, author: true})
  end

  def remove_saved_tool(tool_id:)
    user_tool = UserTool.where(user_id: self.id, tool_id: tool_id)

    
    user_tool
  end

  def remove_posted_tool(tool_id:)
    user_tool = UserTool.where(user_id: self.id, tool_id: tool_id).destroy
    user_tool
  end

  def vote_tool(tool_id:, points:)

  end

end
