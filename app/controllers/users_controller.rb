class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def show
    user_id = params[:user_id].to_i
    if user_id == current_user.id
      @user = User.find(current_user.id)
    else
      @user = User.find(user_id)
    end
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
  	@user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render "users/edit"
    end
  end


  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
