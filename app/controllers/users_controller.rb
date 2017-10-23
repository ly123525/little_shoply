class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit!)
    if @user.save
       login(params[:user][:email], params[:user][:password])
       redirect_to root_path, :notice=>'注册成功！'
    else
      render :new
    end
  end
end