# encoding: utf-8
class PostsController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "lcl100icq", :only => :destroy
  before_filter :init_categories_all, :only => [:new, :create, :update, :edit]
  before_filter :init_attrs_all, :only => [:new, :create, :update, :edit]
  before_filter :init_school_years_all, :only => [:new, :create, :update, :edit]
  
  include_kindeditor :only => [:new, :edit]

  # GET /posts
  # GET /posts.json
  def index
    #@posts = Post.limit(20)
    @posts = SchoolYear.first.posts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def index_by_school_year
    @posts = Post.where(:school_year_id => params[:school_year_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @posts = Post.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @category_id = @post.category_id
    @attr_id = @post.attr_id
    @school_year_id = @post.school_year_id
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.category_id = params[:category]
    @post.attr_id = params[:attr]
    @post.school_year_id = params[:school_year]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '创建成功' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.category_id = params[:category]
    @post.attr_id = params[:attr]
    @post.school_year_id = params[:school_year]

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: '更新成功' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end

  private

  def init_categories_all
    @categories = Category.all
  end

  def init_attrs_all
    @attrs = Attr.all
  end
  
  def init_school_years_all
    @school_years = SchoolYear.all
  end
end
