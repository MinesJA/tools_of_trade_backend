class UserTool < ApplicationRecord
  belongs_to :tool
  belongs_to :user

  validates_uniqueness_of :tool_id, :scope => :user_id, :message => "can't be saved by user more than once." 
end
