class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    if Group.create(group_params)
      redirect_to root_path, notice: 'グループが作成されました'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    redirect_to root_path, notice: 'グループが作成されました' if group.update(group_params)
  end

  private

  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
