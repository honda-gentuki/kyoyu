class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    redirect_to action: :index unless @user.id == current_user.id
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :age, :school,
                                 :subject, :club, :a_word)
  end
end
