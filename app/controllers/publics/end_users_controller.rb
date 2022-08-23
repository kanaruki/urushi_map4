class Publics::EndUsersController < ApplicationController
  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(end_user_params)
    redirect_to end_users_mypage_path(@end_user)
  end

  def confirm
  end

  def withdrawal
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name,:image,:introduction,:email,:is_deleted)
  end
end
