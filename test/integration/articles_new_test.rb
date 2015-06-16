require 'test_helper'

class ArticlesNewTest < ActionDispatch::IntegrationTest
  test "does not create invalid articles" do
		assert_no_difference 'Article.count' do
			post articles_path, article: { title: "", body: "" }  	
		end
  end

  test "renders articles/new after failed creation" do
  	post articles_path, article: { title: "", body: "" } 
  	assert_template 'articles/new'
  end
end
