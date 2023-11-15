class PostsController < ApplicationController
  before_action :set_post ,only: %i[edit update destroy]
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: '投稿に成功しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), success: '投稿を編集しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: '投稿を削除しました'
    
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
