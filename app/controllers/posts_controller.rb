class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve, :mark_as_spam]

  # GET /posts
  def index
    tags = params[:tags]
    @posts = if tags.blank?
               Post.all.includes({ employee: [:user] }, :tags)
             else
               Post.all.includes({ employee: [:user] }, :tags).tagged_with tags
             end
  end

  # GET /posts/1
  def show
    @comments = @post.comments.includes(:user)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  # PATCH mark_as_spam
  def mark_as_spam
    @post.mark_as_spam
    redirect_to :back, notice: 'post marked as spam'
  end

  def approve
    @post.approve
    redirect_to :back, notice: 'post marked as approved'
  end

  def favorite
    current_user.mark_as_favorite @post
    redirect_to :back, notice: 'post marked as favorite'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :content, :topic_id, :tag_list, :reply_to_id)
  end
end
