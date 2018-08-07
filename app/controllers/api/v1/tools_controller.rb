

class Api::V1::ToolsController < ApplicationController

  def index
    tags = tool_params[:tags]
    searchTerm = tool_params[:searchTerm].downcase

    if tags != "" && searchTerm != ""
      tags = tool_params[:tags].split(",")
      tools = []

      tags.each do |tagString|
        tag = Tag.find{|tag| tag.name == tagString}

        tools.push(tag.tools)
      end

      tools = tools.flatten.uniq

      @tools = tools.select do |tool|
          tool.name.downcase.include?(searchTerm) ||
          tool.description.downcase.include?(searchTerm)
        end


    elsif tags != ""
      tags = tool_params[:tags].split(",")
      tools = []

      tags.each do |tagString|
        tag = Tag.find{|tag| tag.name == tagString}

        tools.push(tag.tools)
      end

      @tools = tools.flatten.uniq
      
    elsif searchTerm != ""
      # Only get a searchTerm

      @tools = Tool.all.select do |tool|
          tool.name.downcase.include?(searchTerm) || tool.description.downcase.include?(searchTerm) || tool.url.downcase.include?(searchTerm)
        end

    else
      @tools = Tool.all.sort_by{|tool| tool.downvotes - tool.upvotes}[0..5]
    end

    render json: @tools
  end


  def show
    @tool = Tool.find(params[:id])
    render json: @tool, status: 200
  end


  def create
    @tool = Tool.new(name: tool_params[:name], description: tool_params[:description], url: tool_params[:url])
    @tag_errors = Tag.process_tag_strings(tool_params[:tag_strings], @tool)
    @user = User.find_or_create_by(name: tool_params[:posted_by])

    if @tag_errors.none? && @user.valid?
      @tool.user = @user

      if @tool.save
        render json: @tool.to_json
      else
        render :json => { :errors => {tool: @tool.errors.full_messages, tag: @tag_errors, user: @user.errors.full_messages }}
      end
    end
  end





  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
  end

  private

  def tool_params
    params.permit(:name, :description, :tags, :searchTerm, :url, {:tag_strings => []}, :posted_by, :upvotes, :downvotes, :user_id, :number)
  end



end
