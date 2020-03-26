class UsersController < ApplicationController
  def index
    @users=User.all.order(created_at: :desc)
  end
  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
  # def search
  #   @users = User.search(params[:keyword])
    
  # end
  private
  def user_params
    params.require(:user).permit(:name,:image,:profile,:sex,:age,:tall).merge(user_id: current_user.id)
  end
end
