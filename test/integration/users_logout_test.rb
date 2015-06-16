require 'test_helper'

class UsersLogoutTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:one)
	end

	test "destroys user session upon logout" do
		log_in_as(@user)
		delete logout_path
		assert_redirected_to root_path
	end
end
