# frozen_string_literal: true

class Publics::SessionsController < Devise::SessionsController

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    test = EndUser.where(email: end_user_params[:email])
    if end_user_params[:email].blank?
      redirect_to new_end_user_session_path, notice: '登録してあるメールアドレスを入力してください'
    elsif end_user_params[:password].blank?
      redirect_to new_end_user_session_path, notice: '登録してあるパスワードを入力してください'
    elsif test[0][:is_deleted] == false
      super
    else
      redirect_to new_end_user_session_path, notice: '退会したアカウントではログインできません'
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    end_users_mypage_path
  end

  # protected
  private
    def end_user_params
      params.require(:end_user).permit(:email,:password)
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
