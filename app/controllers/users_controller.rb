class UsersController < ApplicationController

  allow_unauthenticated_access only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Usuário criado com sucesso!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nome, :email_address, :password, :password_confirmation)
  end
end