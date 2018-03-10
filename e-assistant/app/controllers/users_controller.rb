class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def login
    @user = User.find_by(user_id: params[:user_id], password: params[:password])
    if @user
      flash[:notice] = "ログインに成功しました"
      redirect_to("/users/#{@user.id}")
    else
      render("home/top")
    end
  end
end
