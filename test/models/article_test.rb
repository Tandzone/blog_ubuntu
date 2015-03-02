require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should create artcile" do
    article = Article.new
    article.user = users(:eugene)
    article.title = "Testing article"
    article.body = "Test body"

    assert article.save
  end
end
