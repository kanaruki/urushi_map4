class Publics::GroupUsersController < ApplicationController
  def destroy
    @group = Group.find(params[:id])
    @end_user = current_end_user
    @group.end_users.delete(current_end_user)
    redirect_to groups_path
  end
end
