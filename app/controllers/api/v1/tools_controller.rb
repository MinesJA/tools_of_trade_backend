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


  def save
    if(!!curr_user)
      @user_tool = curr_user.save_tool(tool_id: tool_params[:id])
      if(@user_tool.save)

        render json: {tool: @user_tool.tool}, status: 200
      else
        render json: {error: "Tool already exists."}, status: 406
      end
    else
      render json: {error: "No user found"}, status: 401
    end
  end


  # def unsave
  #
  # end
  #
  # def vote
  #   # check if upvote or downvote
  # end


  def update
    user = curr_user

    if(!!user)
      @tool = user.save_tool(tool_params[:id])
      render json: @tool
    else
      render json: {error: "No user found"}
    end

    user.tools << @tool

    render json: @tool
  end


  def create
    user = curr_user

    if(!!user)
      @tool = user.post_tool(name: tool_params[:name], description: tool_params[:description], url: tool_params[:url], tag_strings: tool_params[:tag_strings])
      render json: @tool
    else
      render json: {error: "No user found"}
    end
  end


  def destroy
    @user = curr_user

    if(!!@user)
      @tool = @user.remove_saved_tool(tool_id: tool_params[:id])
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
