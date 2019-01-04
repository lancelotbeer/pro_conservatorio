class CommentsController < ApplicationController
  before_action :authenticate_user!
  #authorize_resource
  def create
    @comment = Comment.new(content: params[:comment][:content])
    @comment.user = current_user
    @comment.post_id = params[:post_id]

    authorize! :create, @comment
    @comment.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
      @post = @comment.post
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
end
