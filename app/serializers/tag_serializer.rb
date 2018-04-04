class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :tools
  has_many :tools

  def tools
    object.tools
  end
  
end
