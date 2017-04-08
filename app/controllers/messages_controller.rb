class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:group_id].present?
      @group = Group.find(params[:group_id])
      @messages = @group.messages
    else
      @group = current_user.groups.first
      @messages = @group.messages
    end
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    if Message.create(group_params)
      group = Group.find(params[:group_id])
      @messages = group.messages
    else
      redirect_to root_path, notice: 'メッセージの送信に失敗しました'
    end
  end

  private
  def group_params
    params.require(:message).permit(:body, :group_id).merge(user_id: current_user.id)
  end
end
