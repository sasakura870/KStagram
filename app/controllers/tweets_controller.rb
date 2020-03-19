class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    # @tweet = Tweet.new(tweet_params)
    #     if @tweet.save
    #         render 'index'
    #     else
    #         render 'new'
    #     end
    Tweet.create(tweet_params)
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
  end
  
  

  private
  def tweet_params
    params.require(:tweet).permit(:name,:image, :text).merge(user_id: current_user.id)
  end

  
  
end
