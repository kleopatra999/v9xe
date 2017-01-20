# coding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
  user = User.authenticate(params[:session][:email],params[:session][:password])
    if user.nil?
      flash.now[:error] = "用户名或密码错误"
      @title = "注册"
      render 'new'
    else 
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
