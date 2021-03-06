class CommentsController < ApplicationController

  # Not sure why I wrote this
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /challenges/:challenge_id/comments 
  # GET /challenges/:challenge_id/comments.json
  def index
    challenge = Challenge.find(params[:challenge_id])
    @comments = Comment.all
  end

  # GET /challenges/:challenge_id/comments/1
  # GET /challenges/:challenge_id/comments/1.json
  def show
    challenge = Challenge.find(params[:challenge_id])
    @comment = challenge.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end


  # GET /challenges/:challenge_id/comments/new
  # GET /challenges/:challenge_id/comments/new.json
  def new
    challenge = Challenge.find(params[:challenge_id])
    @comment = challenge.comments.build
    respond_to do |format|
      format.html { render :new }
      format.xml  { render :xml => @comment }
    end
  end

  def edit
    challenge = Challenge.find(params[:challenge_id])
    @comment = challenge.comments.find(params[:id])
  end


  def create
  challenge = Challenge.find(params[:challenge_id])
  @comment = challenge.comments.create(comment_params)
  @comment.user = current_user
  @comment.challenge = challenge

  respond_to do |format|
    if @comment.save
      flash[:success] = 'Your comment was successfully posted'
      format.html { redirect_to(@comment.challenge) }
      format.xml  { render :xml => @comment, :status => :created, :location => @comment.challenge}
    else
      flash[:danger] = 'Your comment could not be posted. Please try again'
      format.html { redirect_to(@comment.challenge) }
      format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
    end
  end
end

  # PUT /challenges/:challenge_id/comments/:id
  # PUT /challenges/:challenge_id/comments/:id.xml
  def update
    challenge = Challenge.find(params[:challenge_id])
    @comment = challenge.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:success] = 'Your comment was successfully updated'
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.challenge, @comment]) }
        format.xml  { head :ok }
      else
        flash[:danger] = 'Your comment could not be updated. Please try again'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /posts/:post_id/comments/1
  # DELETE /posts/:post_id/comments/1.xml
  def destroy
    challenge = Challenge.find(params[:challenge_id])
    @comment = challenge.comments.find(params[:id])
    @comment.destroy
    flash[:info] = 'Your comment was successfully deleted'

    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(@comment.challenge, :info => 'Comment was successfully deleted') }
      format.xml  { render :xml => @comment, :status => :created, :location => @comment.challenge }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only accept the correct parameters.
    def comment_params
      params.require(:comment).permit(:title, :body, :user_id, :challenge_id, :replies, :timestamp)
    end
  end
