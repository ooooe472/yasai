class PostsController < ApplicationController
   
  before_action :authenticate_user!, only: [:new, :create]
  
  def hashtag  #追記
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    else
      name = params[:name]
      name = name.downcase
      @hashtag = Hashtag.find_by(hashname: name)
      @post = @hashtag.posts
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.posts.count}
    end
  end
  
  def index
        @posts = Post.all
   
    if params[:search] == nil
      @posts= Post.all
  elsif params[:search] == ''
      @posts= Post.all
  else
      #部分検索
      @posts = Post.where("hashbody LIKE ? ",'%' + params[:search] + '%')
  end
end

    def new
        @post = Post.new
       
      end

      def create
        @post = Post.new(post_params) 
        @post.user_id = current_user.id 
        
         if @post.save                                                
          redirect_to :action => "index"
      else
          redirect_to :action => "new"
      end
         end
      
     

      def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
      end

     
      
      def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
      end

    
    def toppage
    end
    
      private
      def post_params
        params.require(:post).permit(:lat,:lng,:image,:meet, :hashbody, posts: [], hashtag_ids: [])
      end
end
