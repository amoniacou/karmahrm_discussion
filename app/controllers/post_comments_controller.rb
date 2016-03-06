class PostCommentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]

  # GET /post_comments
  def index
    @post_comments = PostComment.all
  end

  # GET /post_comments/1
  def show
  end

  # GET /post_comments/new
  def new
    @post_comment = PostComment.new
  end

  # GET /post_comments/1/edit
  def edit
  end

  # POST /post_comments
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.comments.new(post_comment_params)
    @post_comment.user = current_user
    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to @post_comment.post, notice: 'Post comment was successfully created.' }
        format.json { render :show, status: :created, location: @post_comment }
        format.js   { render layout: false }
      else
        @has_error = true
        format.html { render partial: :new }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /post_comments/1
  def update
    if @post_comment.update(post_comment_params)
      redirect_to @post_comment, notice: 'Post comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /post_comments/1
  def destroy
    @post_comment.destroy
    redirect_to post_comments_url, notice: 'Post comment was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post_comment
    @post_comment = PostComment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_comment_params
    params.require(:post_comment).permit(:content)
  end
end
