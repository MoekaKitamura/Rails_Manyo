class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :login_required, only: [:new, :create]
  before_action :already_logged_in, only: [:new, :create]
  before_action :same_user_or_admin_required, only: %i[ show edit update destroy ]
  def index
    @users = User.order(created_at: :asc)
    redirect_to admin_users_path(@user) if current_user.admin == true
  end

  def show
    @tasks = @user.tasks.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def edit
    redirect_to edit_admin_user_path(@user) if current_user.admin == true
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "ユーザーを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザーを変更しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_url, notice: "ユーザーを削除しました。"
    else
      redirect_to users_url, notice: "このユーザーは削除できません。"
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :admin)
  end
end
