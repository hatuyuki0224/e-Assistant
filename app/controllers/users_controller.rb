class UsersController < ApplicationController

  # before_action :authenticate_user, {only: [:show, :edit, :update, :edit_form]}
  # before_action :forbid_login_user, {only: [:new, :create, :login]}
  # before_action :ensure_correct_user, {only: [:edit, :update]}

  def show
    @user = User.find_by(id: params[:id])
  end

  def login
    @user = User.find_by(user_id: params[:user_id], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "ログイン名またはパスワードが違います"
      render("home/login")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.user_id = params[:user_id]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if params[:image]
      @user.user_image = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/img/#{@user.user_image}", image.read)
    end


    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  # def ensure_correct_user
  #   if @current_user.id != params[:id].to_i
  #     flash[:notice] = "権限がありません"
  #     redirect_to("/users/#{@current_user.id}")
  #   end
  # end


end
