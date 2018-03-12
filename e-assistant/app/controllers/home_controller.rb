class HomeController < ApplicationController
  def top
    @user = User.find_by(user_id: params[:user_id])

  end

  def new
  end

  def create
    @user = User.new(email: params[:email], user_id: params[:user_id],
      password: params[:password], password_confirmation: params[:password_confirmation])


    if @user.password == @user.password_confirmation
      if @user.save
        if params[:image]
          @user.user_image = "#{@user.id}.jpg"
          image = params[:image]
          File.binwrite("public/img/#{@user.user_image}", image.read)
          @user.save
        end
        flash[:notice] = "新規登録しました"
        redirect_to("/users/#{@user.id}")
      end

    else
      render("home/top")

    end

    def login
    end

  end
end
