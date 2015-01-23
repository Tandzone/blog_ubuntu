class Comment < ActiveRecord::Base
  belongs_to :article

  validates_presence_of :name, :email, :body
  validate :article_should_be_published

  default_scope lambda {order('comments.created_at DESC')}

  def article_should_be_published
    errors.add(:article_id, "is not published yet") if article && !article.published?
  end

  after_create :email_article_author

  def email_article_author
    puts "We will notify #{article.user.email} in chapter 9"
  end
end
