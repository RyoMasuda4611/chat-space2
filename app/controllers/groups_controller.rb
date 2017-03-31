class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    if Group.create(group_params)
      redirect_to root_path, notice: 'グループが作成されました'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
