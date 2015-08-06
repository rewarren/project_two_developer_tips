class PostsController < ApplicationController
  before_action :authenticate

  def index
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create!(post_params)
    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :category, :command, :description)
  end
  private
  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
