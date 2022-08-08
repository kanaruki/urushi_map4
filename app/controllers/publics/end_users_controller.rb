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

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end



  private

  def end_user_params
    params.require(:end_user).permit(:name,:image,:introduction,:email)
  end
end
