class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, :presence=>{message: '邮箱不能为空'}
  validates :email, :uniqueness=>{message: '邮箱已经存在'}
  validates :email, :format => { with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/, message:'邮箱格式不合法'}, if: proc {|user| !user.email.blank?}
  validates :password, :presence=>{message:'密码不能为空'}, :length=>{message:'密码最短为6位', minimum: 6}, if: :need_validate_password
  validates :password_confirmation, :presence=>{message: '确认密码不能为空'}, if: :need_validate_password
  validates :password, :confirmation=>{message: '两次密码不一致'}, if: :need_validate_password

  #登陆后显示的
  def user_name
    self.email.split("@").first
  end
  #登陆后图表图标显示的
  def user_name_icon
    self.email[0]
  end

  private
  def need_validate_password
    self.new_record? || (!self.password.nil?|| !self.password_confirmation.nil?)
  end
end
