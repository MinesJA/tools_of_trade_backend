
module Api
  module V1
    class TagsController < ApplicationController

      def index
        render json: Tag.includes(:tools), include: ['tools']
      end


      def show

      end


      def create

      end

      private

      def tag_params

      end

    end
  end
end
