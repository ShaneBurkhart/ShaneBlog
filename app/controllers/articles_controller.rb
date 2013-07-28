class ArticlesController < ApplicationController
  before_filter :check_admin

  # GET /articles/
  # GET /articles/.json
  def index
    if @tag != "Articles"
      @articles = Article.where(tag: @tag).paginate page: params[:page]
    else
      @articles = Article.paginate page: params[:page]
    end

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
    if @tag != "Articles"
      @articles = Article.where(tag: @tag).paginate page: params[:page]
    else
      @articles = Article.paginate page: params[:page]
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/create
  # GET /articles/create.json
  def create
    @article = Article.new params[:article]
    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /jobs/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to article_path(@article), notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

    def check_admin
      return if action_name == "index" || action_name == "list" || action_name == "show"
      redirect_to "/404.html" unless admin_signed_in?
    end
end
