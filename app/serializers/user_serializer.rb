class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url, :login #:saved_tools, :posted_tools
  has_many :tools


end
