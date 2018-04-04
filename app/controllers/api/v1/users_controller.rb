
module Api
  module V1
    class UsersController < ApplicationController


      def index
        render json: User.includes(:tools), include: ['tools']
      end


      def show
        @user = User.find(user_params[id])

        render json: user
      end


      def create

      end


      def destroy

      end


      def update

      end


      private

      def user_params

      end

    end
  end
end
