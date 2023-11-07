class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_check)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(params_check)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to task_path(@task)
  end

  private

  def params_check
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
