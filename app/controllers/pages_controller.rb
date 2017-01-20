class PagesController < ApplicationController

 def home
  if signed_in?
  @micropost = current_user.microposts.build
  end
  end

  def contact
  end

end
