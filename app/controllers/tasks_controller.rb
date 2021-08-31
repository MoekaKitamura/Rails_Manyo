class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  
  def index
    @tasks = current_user.tasks.order(created_at: :desc).includes(:user)
    @tasks = current_user.tasks.order(params[:sort])
    if params[:search_task_name].present? && params[:search_status].present?
      @tasks = current_user.tasks.task_name(params[:search_task_name]).status(params[:search_status])
    elsif params[:search_task_name].present?
      @tasks = current_user.tasks.task_name(params[:search_task_name])
    elsif params[:search_status].present?
      @tasks = current_user.tasks.status(params[:search_status])
    end
    @tasks = @tasks.page(params[:page]).per(5)
  end

  def show
    
  end

  def new
    @task = Task.new
  end

  def edit
    
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to @task, notice: "タスクを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "タスクを変更しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "タスクを削除しました。"
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:task_name, :to_do, :deadline, :status, :priority, :sort, :search_name, :search_status, :user_id)
  end
end
