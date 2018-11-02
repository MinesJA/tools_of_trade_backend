class Api::V1::ToolsController < ApplicationController


  def index
    tags = tool_params[:tags]
    search_term = tool_params[:search_term]

    if tags != "" && search_term != ""
      @tools = Tool.tools_from_tags_search_term(tags, search_term)
    elsif tags != ""
      @tools = Tool.tools_from_tags(tags)
    elsif search_term != ""
      @tools = Tool.tools_from_search_term(search_term)
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


  def update
    user = curr_user

    if(!!user)

      if(!!tool_params[:upDown])
        @tool = Tool.find(tool_params[:id])
        if tool_params[:upDown] > 0 then @tool.upvotes += 1 else @tool.downvotes += 1 end
        @tool.save
        render json: @tool, status: 200
      else
        @tool = user.save_tool(tool_params[:id])
        render json: @tool
      end

    else
      render json: {error: "No user found"}
    end

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

      render json: {body: @tool}, status: 200
    else
      render json: {error: "No user found"}
    end
  end

  private

  def tool_params
    params.permit(:id, :name, :description, :tags, :search_term, :url, {:tag_strings => []}, :posted_by, :upvotes, :downvotes, :user_id, :number, :upDown)
  end

end
