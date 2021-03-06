class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page]).per(20)
    @tweet=Tweet.new
    @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').limit(4).pluck(:tweet_id))
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.create(tweet_params)
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end
  def edit
    @tweet = Tweet.find(params[:id]) 
  end
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end
 
  def show
    @tweet = Tweet.find(params[:id]) 
    @like = Like.new
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end
  
  def search
    @tweets = Tweet.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(20)
    @tweet=Tweet.new
    @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').limit(3).pluck(:tweet_id))
  end
  

  private
  def tweet_params
    params.require(:tweet).permit(:name,:image,:title,:text,:sex,:tall,:temp,:typestyle).merge(user_id: current_user.id)
  end

  
end
