# coding: utf-8
module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end
  def signed_in?
    !current_user.nil?
  end 
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end
  

  def current_user?(user)
    user == current_user
  end
    
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end

 

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  
private

  def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.where(remember_token:remember_token).first unless remember_token.nil?
  end

  def clear_return_to
    session.delete(:return_to)
  end
end
