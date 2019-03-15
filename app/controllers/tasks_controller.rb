class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(created_at: :desc).limit(5)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: "タスクを登録しました。"
    else 
      flash[:notice] = @task.errors.full_messages
      render :new
    end 
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "タスクを更新しました。"
    else
      flash[:notice] = @task.errors.full_messages
      render :edit 
    end
  end

  def destroy
    @task.destroy
    redirect_to @task 
  end

  def hide 
    @tasks = Task.all
  end

  private 

  def task_params
    params.require(:task).permit(:title, :memo, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
