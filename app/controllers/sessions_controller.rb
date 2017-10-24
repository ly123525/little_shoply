class SessionsController < ApplicationController
  def new

  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to root_path, :notice=>'登陆成功！'
    else
      redirect_to new_session_path, :alert=>'账户名或密码错误！'
    end
  end

  def destroy
    logout
    redirect_to new_session_path, :notice=>'退出成功！'
  end
end