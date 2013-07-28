class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :latest_articles
  before_filter :init_parser

  def latest_articles
    @latest = Article.order("created_at DESC").take(10)
  end

  def init_parser
    @parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end
end
