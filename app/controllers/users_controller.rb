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
      session[:user_id]=user.id
      flash[:notice]="ユーザー登録しました"
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def index
    @users=User.all.order(created_at: :desc)
  end

  def show
    @user=User.find_by(id: params[:id])
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def update
    user=User.find_by(id: params[:id])
    user.bio=params[:user][:bio]
    if user.save
      flash[:notice]="ユーザー情報を変更しました"
      redirect_to user_url(user)
    else
    end
  end

  def destroy
    user=User.find_by(id: params[:id])
    if user
      user.destroy
      # ログアウトする
      session[:user_id]=nil
      flash[:notice]="アカウントを削除しました"
    end
    redirect_to root_path
  end
end
