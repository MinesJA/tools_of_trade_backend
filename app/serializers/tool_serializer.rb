class ToolSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :upvotes, :downvotes, :user, :tags
  belongs_to :user
  has_many :tags


  def user
    # UserSerializer.new(object.user)
    object.user
  end

  # def tags
  #   object.tags
  # end



end
