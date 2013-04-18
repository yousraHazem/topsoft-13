module UsersHelper

	def isAdmin(current_user)
		User.where(:id => current_user, :isAdmin => true).exists?
	end

end
