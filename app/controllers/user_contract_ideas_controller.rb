class UserContractIdeasController < ApplicationController
  before_action :set_user_contract_ideas, only: [:show, :edit, :update, :destroy]


  # List all the user contracts submitted by one user (member use)
  def index
    @user = User.find(params[:user_id])
    @user_contract_ideas = @user.user_contract_ideas
  end

  # List all user contracts for all users (admin use)
  def index_all
    @users_contract_ideas = UserContractIdea.order('created_at DESC')
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @user = current_user
    @user_contract_idea = UserContractIdea.new

    # @user_contract.created_at= Time.now
    respond_to do |format|
      format.html { render :new }
      format.xml  { render :xml => @user_contract_idea }
    end
  end

  # GET /challenges/1/edit
  def edit
    @user = User.find(params[:user_id])
    @user_contract_idea = @user.user_contract_ideas.find(params[:id])
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @user_contract_idea = UserContractIdea.new(user_contract_idea_params)
    @user_contract_idea.user_id = current_user.id
    respond_to do |format|
      if @user_contract_idea.save
        format.html { redirect_to root_url, notice: 'Your contract idea was successfully submitted, it will be reviewed shortly' }
      else
        format.html { render :new }
        # format.json { render json: @user_conctract_ideas.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @user_contract_idea.update(user_contract_idea_params)
        format.html { redirect_to root_url, notice: 'Your contract idea was successfully updated.' }
      else
        format.html { render :edit }
        # format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @user_contract_idea.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Your contract idea was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_contract_ideas
      @user_contract_idea = UserContractIdea.find(params[:id])
    end

    def user_contract_idea_params
      params.require(:user_contract_idea).permit(:id, :title, :description, :created_at, :code, :user_id)
    end
end
