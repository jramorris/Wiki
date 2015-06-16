require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "should find invalid signup information" do
  	get new_user_path
  		assert_no_difference 'User.count' do
  			post users_path, user: { name: "",
  																 email: "email@invalid"
  			}
  		end
  	assert_template 'users/new'
  end

  test "accepts valid signup information" do
		assert_difference 'User.count', 1 do
			post users_path, user: { name: "Chris",
															 email: "chris@example.com",
                               password: 'password',
                               password: 'password'
			}
		end
  end
  
  test "redirects to user upon signup" do
    post users_path, user: { name: "Chris",
                             email: "chris@example.com",
                             password: 'password',
                             password: 'password'
    }
    follow_redirect!
    assert_template 'users/show'
  end
end
