class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_filter :require_permission, only: [:destroy]

  # GET /comments
  # GET /comments.json


  # GET /comments/new
  def new
    @comment = Comment.new
  end


  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to url_for(:controller => :blogs, :action => :index) }
      else
        format.html { redirect_to url_for(:controller => :blogs, :action => :index) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to url_for(:controller => :blogs, :action => :index) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:mention, :user_id, :blog_id).merge(user: current_user) # as suggested
    end

    def require_permission
      if current_user != Comment.find(params[:id]).user
        redirect_to(:back)
      end
    end
end
