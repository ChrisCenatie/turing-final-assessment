class TaskListsController < ApplicationController
  before_action :authenticate

  def index
    @task_lists = current_user.task_lists
  end

  def create
    task_list = TaskList.new(task_list_params)
    if task_list.save
      current_user.task_lists << task_list
      flash[:notice] = ["Task List Successfully Created!"]
      redirect_to task_lists_path
    else
      flash[:errors] = task_list.errors.full_messages
      redirect_to task_lists_path
    end
  end

  private

    def task_list_params
      params.require(:task_list).permit(:title, :description)
    end
end
