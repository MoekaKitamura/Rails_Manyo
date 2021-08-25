class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = Task.order(created_at: :desc)
    @tasks = Task.order(params[:sort])
    # @keyword1 = params[:search][:keyword1] unless params[:search] == nil
    # @keyword2 = params[:search][:keyword2] unless params[:search] == nil
    # @search = Task.where(task_name: @keyword1)
    #  or Task.where(status: @keyword2)
    # @search = Task.where(status: @keyword2)
    # @search= Task.where ("task_name LIKE ? " , "%#{@keyword1}%" )
    if params[:task_name].present?
      @tasks = Task.task_name(params[:task_name])
    end
    if params[:status].present?
      @tasks = Task.status(params[:status])
    end
    # if params[:search].present?
    #   if @keyword1.present? && @keyword2.present?
    #     @search = Task.where(task_name: @keyword1)
    #   elsif @keyword1.present?
    #     @search = Task.where(task_name: @keyword1)
    #   elsif @keyword2.present?
    #     @search = Task.where(status: @keyword2)
    #   end
    # end
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
    params.require(:task).permit(:task_name, :to_do, :deadline, :status, :priority, :sort, :search, :keyword)
  end
end
