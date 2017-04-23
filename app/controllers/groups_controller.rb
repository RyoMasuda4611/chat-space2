class GroupsController < ApplicationController
  before_action :find_group, only: [:edit, :update]
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    redirect_to root_path, notice: 'グループが作成されました' if Group.create(group_params)
  end

  def edit
  end

  def update
    redirect_to root_path, notice: 'グループが作成されました' if @group.update(group_params)
  end

  def ajax_user_list
    @users = User.where('nickname LIKE(?)', "%#{ params[:q] }%")
  end

  def ajax_add_users
    @group.users << User.find(params[:id])
    redirect_to root_path
  end

  private
  def find_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
