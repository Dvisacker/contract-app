class Challenge < ActiveRecord::Base
	validates :title,  :presence => true, :length => { :minimum => 3}
	validates :body, :presence => true
	validates :code, :presence => true

	has_many :comments, dependent: :destroy
	has_many :submissions, dependent: :destroy
end
