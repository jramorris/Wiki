require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:one)
	end

  test "should log user in" do
  	post login_path, session: { email: "jake@example.com", password: 'password' }
  	assert_redirected_to @user
  end

  test "should render login after failed login" do
  	post login_path, session: { email: 'jake', password: 'jake' }
  	assert_template 'sessions/new'
  end
end
