class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :index]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all
        @comment = Comment.new
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = current_user.posts.create(post_params)
        if @post.save
            flash[:success] = "Your post has been created!"
            redirect_to posts_path
        else
            flash[:alert] = "Your new post couldn't be created! Please check the form."
            render "new"
       end
    end
    
    def show
        @comment = Comment.new
    end
    
    
    def edit
    end
    
    def update
       if @post.save
           flash[:success] = "Post updated."
           @post.update(post_params)
           redirect_to post_path(@post)
       else
           flash.now[:alert] = "Update failed. Please check the form."
           render :edit
       end
    end
    
    def destroy
       @post.destroy
       redirect_to posts_path
    end
    
    
    private
    def set_post
       @post = Post.find(params[:id]) 
    end
    
    def post_params
        params.require(:post).permit(:image, :caption)
    end
end
