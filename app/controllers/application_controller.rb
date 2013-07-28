class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :latest_articles

  def latest_articles
    @latest = Article.order("created_at DESC").take(10)
  end
end
