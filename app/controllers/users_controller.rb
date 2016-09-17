class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'Your self-introduction was successfully updated'
        format.html { redirect_to edit_user_path}
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:danger] = 'Error. Please try again'
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_password 
        @user = User.find(current_user.id)
      if @user.update(user_pass_params)
        flash[:success] = 'Your password was successfully updated'
        redirect_to root_path
      else
        flash[:danger] = 'Your password could not be updated. Please try again'
        render "edit"
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :email, :username, :user_type, :username, :intro)
    end

    def user_pass_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end