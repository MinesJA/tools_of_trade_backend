

    class Api::V1::ToolsController < ApplicationController

      def index
        @tools = Tool.all
        render json: @tools
        # render json: Tool.includes(:user), include: ['user']
      end


      def show
        @tool = Tool.find(params[:id])

        render json: @tool, status: 200
      end


      def create
        # byebug


        # @tool = Tool.new(tools_params)
        # @tool.save

        render json: tool_params
      end


      def destroy

      end


      def update
        @tool = Tool.find(params[:id])
        @tool.update(tool_params)
      end

      private

      def tool_params
        params.require(:tool).permit(:name, :description, :url, :tag_strings, :posted_by, :upvotes, :downvotes, :user_id)
      end



    end
