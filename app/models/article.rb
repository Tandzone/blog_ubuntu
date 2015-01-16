class Article < ActiveRecord::Base
  validates_presence_of :title, :body

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :replies, :through => :articles, :source => :comments

  def long_title
    "#{title} - #{published_at}"
  end
end
