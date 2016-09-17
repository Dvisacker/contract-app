class UserContractsController < ApplicationController
  before_action :set_user_contract, only: [:show, :edit, :update, :destroy]


  # List all the user contracts submitted by one user (member use)
  def index
    @user = User.find(params[:user_id])
    @user_contracts = @user.user_contracts
  end

  # List all user contracts for all users (admin use)
  def index_all
    # @users = User.all
    @user_contracts = UserContract.order('created_at DESC')
    @users = User.all.includes(:user_contract)
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @user = current_user
    @user_contract = UserContract.new

    # @user_contract.created_at= Time.now
    respond_to do |format|
      format.html { render :new }
      format.xml  { render :xml => @user_contract }
    end
  end

  # GET /challenges/1/edit
  def edit
    @user = User.find(params[:user_id])
    @user_contract = @user.user_contracts.find(params[:id])
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @user = current_user
    @user_contract = UserContract.new(user_contract_params)
    @user_contract.user_id = current_user.id
    respond_to do |format|
      if @user_contract.save
        flash[:success] = 'Your contract was successfully submitted, it will be reviewed shortly'
        format.html { redirect_to root_url }
      else
        format.html { render :new }
        flash[:danger] = 'Your contract could not be submitted, please try again'
        # format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @user_contract.update(user_contract_params)
        flash[:success] = 'Your contract submission was successfully updated'
        format.html { redirect_to root_url }
        # format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        flash[:danger] = 'Your contract could not be updated, please try again'
        # format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @user_contract.destroy
    respond_to do |format|
      flash[:success] = 'Your contract submission was successfully deleted.'
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_contract
      @user_contract = UserContract.find(params[:id])
    end

    def user_contract_params
      params.require(:user_contract).permit(:id, :title, :description, :created_at, :code, :contract_adress, :user_id)
    end
end