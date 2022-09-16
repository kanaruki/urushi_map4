class Publics::GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def show
    @group = Group.find(params[:id])
    @place = Place.new
  end

  def index
    @end_user_group_all = current_end_user.groups
    @group_user = GroupUser.new
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
    @group = Group.find(params[:group_user][:group_id])
    end_user = EndUser.find(params[:group_user][:end_user_id])
    # if @group.end_users.include?(current_end_user)
    #   redirect_to groups_path, notice: '選択したグループはすでに参加しています'　＜ー　本番環境でinclude?がnomethoderrorになるためコメントアウトする
    # else
      @group.end_users << end_user
      redirect_to group_path(@group), notice: "ユーザーを追加しました。"
    # end
  end

  private

  def group_params
    params.require(:group).permit(:name,:introduction,:image,:is_open,:group_id,:end_user_id)
  end
end
