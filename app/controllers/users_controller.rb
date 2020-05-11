class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    user=User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password]
    )
    if user.save
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def login
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
