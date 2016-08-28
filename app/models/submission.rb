class Submission < ActiveRecord::Base

	validates :submission_text, :presence => true

	belongs_to :user
	belongs_to :challenge
end
