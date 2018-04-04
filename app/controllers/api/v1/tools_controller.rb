
module Api
  module V1
    class ToolsController < ApplicationController



      def index
        render json: Tool.includes(:user), include: ['user']
      end


      def show
        @tool = Tool.find(params[:id])

        render json: @tool, status: 200
      end


      def create
        @tool = Tool.new(tools_params)
        @tool.save
      end


      def destroy

      end


      def update
        @tool = Tool.find(params[:id])
        @tool.update(tool_params)
      end

      private

      def tool_params
        params.require(:tool).permit(:name, :description, :url, :upvotes, :downvotes, :user_id)
      end





    end
  end
end
