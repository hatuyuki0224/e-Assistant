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

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.user_id = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    if params[:image]
    @user.user_image = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/img/#{@user.user_image}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end


end
