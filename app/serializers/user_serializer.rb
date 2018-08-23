class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url, :login
  has_many :tools
end
