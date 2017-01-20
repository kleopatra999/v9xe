class MicropostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy
  def create
  
    @micropost = current_user.microposts.new params[:micropost]
    if @micropost.save
      flash[:success] = "Micropost created!"
     redirect_to root_path
      
    else
      render 'pages/home'
    end
  end
  
  def destroy
    @micropost.destroy
    redirect_to root_path
  end
  private
  def correct_user
     # @micropost = current_user.microposts.find_by_id(params[:id])
      @micropost = current_user.microposts.where(_id:params[:id]).first
      redirect_to root_path if @micropost.nil?
    end
end
