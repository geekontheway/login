class HomeController < BaseController
  def login
    if params[:username].present? && params[:password].present?
      user = User.find_by(username: params[:username])
      if user.present? && user.valid_password?(params[:password])
        sign_in user
        redirect_to root_path, :notice => '登陆成功'
      else
        redirect_to root_path, :alert => '账号或密码不正确'
      end
    else
      redirect_to root_path, :alert => '账号或密码不正确'
    end
  end

  def stat
    render json: {user: user_count , stranger: stranger_count }
  end

  def register
    user = User.create(sign_up_params)
    if user.persisted?
      sign_in user
      redirect_to root_path, :notice => '注册成功'
    else
      redirect_to root_path, :alert => "注册失败, #{user.errors.full_messages.join('，')}"
    end
  end

  def quit
    sign_out current_user
    if !current_user
      redirect_to root_path, :alert => "您已退出登陆"
    else
      redirect_to root_path, :alert => "退出失败"
    end
  end

  def index
    session[:form] = params[:form]
  end

    private
    def sign_up_params
      params.require(:user).permit(
          :username,
          :email,
          :password,
          :password_confirmation
      )
    end
    def sign_in_params
      params.require(:user).permit(
          :username,
          :password,
          :remember_me
      )
    end
end
