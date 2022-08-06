class Publics::GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def show
    @group = Group.find(params[:id])
  end

  def index
    @end_user_group_all = current_end_user.groups
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
       @group.end_users << current_end_user
      redirect_to group_path(@group), notice: 'グループを作成しました'
    else
      render:new
    end
  end

  def add_user
    @group = Group.find(params[:group_id])
    end_user = EndUser.find(params[:user_id])
    @group.users << end_user
    redirect_to group_path, notice: "ユーザーを追加しました。"
  end

  private

  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end
end
