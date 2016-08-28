class Comment < ActiveRecord::Base
  
  validates :title,  :presence => true, :length => { :minimum => 3}
  validates :body, :presence => true

  belongs_to :challenge
  belongs_to :user
  
end
