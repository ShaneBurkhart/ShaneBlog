class ArticlesController < ApplicationController
  # GET /articles/
  # GET /articles/.json
  def index
    @articles = Article.paginate page: params[:page]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/list
  # GET /articles/list.json
  def list
    @articles = Article.paginate page: params[:page]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @articles }
    end
  end
end