class Tool < ApplicationRecord
  belongs_to :user
  has_many :tag_tools
  has_many :tags, through: :tag_tools

  validates :name, {presence: true, uniqueness: true, length: { maximum: 20 }}
  validates :user_id, {presence: true, numericality: { only_integer: true }}
  validates :description, {presence: true, length: {:in => 5..500}}
  validates :url, presence: true



  





end
