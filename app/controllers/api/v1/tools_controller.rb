

    class Api::V1::ToolsController < ApplicationController

      def index
        count = params[:number].to_i - 1
        @tools = Tool.all.sort_by{|tool| tool.downvotes - tool.upvotes}
        @n_tools = @tools[0..count]

        render json: @n_tools
        # render json: Tool.includes(:user), include: ['user']
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
        params.require(:tool).permit(:name, :description, :url, {:tag_strings => []}, :posted_by, :upvotes, :downvotes, :user_id, :number)
      end



    end
