require 'test_helper'

class UsersEditArticleTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:one)
		@article = articles(:first)
	end

  test "does not render 'articles/edit' view when not logged in" do
		get edit_article_path(@article)
		follow_redirect!
		assert_template 'sessions/new'
  end

  test "renders 'articles/edit' view when logged in" do
  	log_in_as(@user)
  	get edit_article_path(@article)
		assert_template 'articles/edit'
  end
end
