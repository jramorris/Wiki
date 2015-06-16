require 'test_helper'

class ArticlesEditTest < ActionDispatch::IntegrationTest
  def setup
  	@article = articles(:first)
  end
  
	test "does not update article with invalid information" do
  	patch article_path(@article), article: { title: "",
  													 body: ""
  	}
  	assert_template 'articles/edit'
  end

  test "updates article with valid information" do
    patch article_path(@article), article: { title: "First article", body: "first article body, this is."}
    assert_response :redirect
  end
end
