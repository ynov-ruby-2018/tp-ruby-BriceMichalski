class MessagesController < ApplicationController
  def index
    @message = Message.new
    @like = Like.new
    @dislike = Dislike.new
    if current_user
      @messages = Message.last(20)
    else
      redirect_to user_session_path
    end
  end

  def like
    @like = Like.new(like_params)
    @like.save
    redirect_to root_path
  end

  def dislike
    @dislike = Dislike.new(dislike_params)
    @dislike.save
    redirect_to root_path
  end

  def create
    @post = Message.new(message_params)

    @post.save
    redirect_to root_path
  end

  def edit
    @post = Message.find(params[:id])
  end

  def update
    @post = Message.find(params[:id])
    @post.update_attributes(message_params)
    redirect_to root_path
  end

  def destroy
    @post = Message.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(
        :content
    ).merge(user_id: current_user.id)
  end

  def like_params
    params.require(:like).permit(
        :message_id
    )
  end
  def dislike_params
    params.require(:dislike).permit(
        :message_id
    )
  end
end