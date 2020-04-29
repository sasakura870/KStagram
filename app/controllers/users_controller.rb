class UsersController < ApplicationController
  def index
    @users=User.all.order(created_at: :desc).page(params[:page]).per(20)
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @tweets=@user.tweets
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
  def search
    @user = User.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(20)
  end
  
  
  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
end

def followers
  @user  = User.find(params[:id])
  @users = @user.followers
  render 'show_follower'
end
  private
  def user_params
    params.require(:user).permit(:name,:image,:profile,:sex,:age,:tall).merge(user_id: current_user.id)
  end
end
