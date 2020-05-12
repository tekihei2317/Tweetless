class SessionsController < ApplicationController
  # get /login
  def new
  end

  # post /login
  def create
    email=params[:sessions][:email]
    password=params[:sessions][:password]

    user=User.find_by(email: email)
    if user.nil?
      redirect_to login_path
    else
      if password!=user.password
        redirect_to login_path
      else
        session[:user_id]=user.id
        flash[:notice]="ログインしました"
        redirect_to users_path
      end
    end
  end

  # delete /logout
  def destroy
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to root_path
  end

end
