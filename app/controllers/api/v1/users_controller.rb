class Api::V1::UsersController < ApplicationController

  def save_tool
    byebug
    Tool.find(id)

    user = curr_user
  end

  # user should be able to post a tool
  # user should be able to save a tool




end
