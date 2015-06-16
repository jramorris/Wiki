require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:one)
	end

  test "should not update user with invalid information" do
  	get edit_user_path(@user)
  	patch user_path(@user), user: { name: "",
  													 email: "email@invalid"
  	}
  	assert_template 'users/edit'
  end
end
