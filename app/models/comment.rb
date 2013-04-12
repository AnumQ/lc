class Comment < ActiveRecord::Base
  attr_accessible :body, :log_id, :user_id
  
  belongs_to :log
  belongs_to :user
  
  validates_presence_of :log_id
  validates_presence_of :user_id
  validates_presence_of :body
end
