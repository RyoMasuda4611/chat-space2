class MessagesController < ApplicationController
  def index
    if params[:group_id].present?
      @group = Group.find(params[:group_id])
    else
      @group = current_user.groups.first
    end
    @groups = current_user.groups
  end
end
