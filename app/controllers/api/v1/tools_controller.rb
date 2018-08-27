class Api::V1::ToolsController < ApplicationController

  def index
    # Need to figure out best way to add limits to SQL statements
    tags = tool_params[:tags]
    searchTerm = tool_params[:searchTerm]

    if tags != "" && searchTerm != ""
      @tools = Tool.tools_from_tags_searchterm(tags, searchTerm)
    elsif tags != ""
      @tools = Tool.tools_from_tags(tags)
    elsif searchTerm != ""
      @tools = Tool.tools_from_searchterm(searchTerm)
    else
      @tools = Tool.all.sort_by{|tool| tool.downvotes - tool.upvotes}
    end

    render json: @tools
  end


  def update
    @tool = Tool.find(tool_params[:id])
    @tool.update(tool_params)
  end

  def create
    @user = curr_user

    if(!!@user)
      byebug
      @tool = @user.post_tool(name: tool_params[:name], description: tool_params[:description], url: , tag_strings:)
      render json: @tool
    else
      render json: {error: "No user found"}
    end
  end

  private

  def tool_params
    params.permit(:id, :name, :description, :tags, :searchTerm, :url, {:tag_strings => []}, :posted_by, :upvotes, :downvotes, :user_id, :number)
  end



end
