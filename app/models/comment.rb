class Comment < ActiveRecord::Base
  validates :body, :presence => true
  belongs_to :challenge
  belongs_to :user
  
end
