class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :destroy]
  before_action :post_params, only: [:create, :update]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.save
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    @post = Post.new(params[:post].permit(:title, :body))
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
