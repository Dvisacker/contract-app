class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    challenge = Challenge.find(params[:challenge_id])
    @submission = challenge.submissions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /submissions/new
  def new
    @challenge = Challenge.find(params[:challenge_id])
    @submission = Submission.new
    respond_to do |format|
      format.html { render :new }
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    challenge = Challenge.find(params[:challenge_id])
    @submission = challenge.comments.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.json
  def create
      challenge = Challenge.find(params[:challenge_id])
      @submission = challenge.submissions.create(submission_params)
      @submission.user = current_user
      @submission.challenge = challenge

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission.challenge, notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @submission.challenge }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submission
      @submission = Submission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submission_params
      params.require(:submission).permit(:project_id, :key, :challenge_id, :submission_text, :submission_time, :complete, :user_id, :admin_id)
    end
end
