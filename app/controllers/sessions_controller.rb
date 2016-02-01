class SessionsController < ApplicationController

  def oauth_create
    user = User.create_or_find_by_oauth(request.env["omniauth.auth"])
    if user
      flash[:notice] = "Login successful"
    else
      flash[:notice] = "Something went wrong, try again"
    end
    redirect_to root_path
  end

end
