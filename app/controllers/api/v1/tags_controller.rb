
class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags
  end


  def show

  end


  def create
    binding.pry

  end

  private

  def tag_params

  end

end
