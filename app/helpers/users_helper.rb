module UsersHelper
	def admin?
		current_user.admin == true
	end

	def admin_present?
		current_user && current_user.admin?
	end
end
