class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new()
  end

  def create
    new_task = Task.new(task_params)
    new_task.save
    redirect_to task_path(new_task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@tasks)
  end

  def destroy
    task_to_delete = Task.find(params[:id])
    task_to_delete.destroy
    redirect_to task_path
  end

    private

  def task_params
    params.require(:task).permit(:name, :status)
  end


end
