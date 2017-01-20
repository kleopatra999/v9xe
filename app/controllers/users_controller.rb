# coding: utf-8
class UsersController < ApplicationController
  def new
		@title= "注册"
    @user= User.new
  end
  def create
    @user = User.new params[:user]
    if @user.save
       flash[:notice] = "Successfully created User."
    
       redirect_to @user
    else
      render 'new'
	  end
  end
	def show 
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page]) 
  end

  def index
    @users = User.all
  end
 
end
