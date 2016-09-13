module UsersHelper

	def comment_count(user_param)
		Comment.joins(:user).where('users.username' => user_param.username).count
	end

	def submission_count(user_param)
		Submission.joins(:user).where('users.username' => user_param.username).count
	end
	
end
