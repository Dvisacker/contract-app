class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.order('created_at DESC')
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    # comments are shown in the same view
    @challenge.increment!(:user_viewcount)
    @comments = @challenge.comments.all
    @comment = @challenge.comments.build
    @comment.user = current_user
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
    @challenge.user_viewcount = 0
    @challenge.created_at= Time.now
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        flash[:success] = 'Challenge was successfully created'
        format.html { redirect_to @challenge }
        format.json { render :show, status: :created, location: @challenge }
      else
        flash[:error] = 'Challenge could not be saved. Please try again'
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        flash[:success] = 'Challenge was successfully updated'
        format.html { redirect_to @challenge }
        format.json { render :show, status: :ok, location: @challenge }
      else
        flash[:error] = 'Challenge could not be updated. Please try again'
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      flash[:success] = 'Challenge was successfully destroyed'
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge).permit(:id, :title, :body, :created_at, :code, :hint1, :hint2, :user_viewcount)
    end
end
