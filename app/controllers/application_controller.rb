class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :latest_articles
  before_filter :init_parser
  before_filter :init_tag

  def latest_articles
    @latest = Article.order("created_at DESC").take(10)
  end

  def init_parser
    @parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end

  def init_tag
    @tag = valid_tag?(params[:tag]) ? params[:tag] : "Articles"
  end

  def tags
   Article.tags
  end

  def valid_tag? tag
    tags.each{|t| return true if tag == t}
    false
  end
end
