class TasksController < ApplicationController
  # homepage (display all of the tasks)
  def index
    @tasks = Task.all
  end
# click on a link to go to a specific task page
  def show
    @task = Task.find(params[:id])
  end
# creating a new task, both methods (get @ post)
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end
# Updating a task (get & post)
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
