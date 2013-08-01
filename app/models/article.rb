class Article < ActiveRecord::Base
  attr_accessible :body, :title, :tag

  validates :body, :title, :tag, presence: true
  validates :body, :title, uniqueness: true
  validate :check_tag

  def self.tags
    [
      "Startups",
      "Projects",
      "Articles",
      "AboutMe"
    ]

  end

  private
    def check_tag
      Article.tags.each{|t| return if tag.include?(t)}
      errors.add(:tag, "Not a valid tag!")
    end
end
