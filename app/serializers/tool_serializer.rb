class ToolSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url, :upvotes, :downvotes
  belongs_to :user
  has_many :tags


end
