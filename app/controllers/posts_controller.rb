class PostsController < ApplicationController
  
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :body))
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end
end
