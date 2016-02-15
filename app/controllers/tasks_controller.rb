class TasksController < ApplicationController
  def new
    @task = Task.new()
  end

  def create
    task = Task.new(task_params)
    if task.save
      task.update(task_list_id: params[:task_list_id])
      flash[:notice] = ["Task successfully added"]
      redirect_to task_lists_path
    else
      flash[:errors] = task.errors.full_messages
      redirect_to new_task_list_task_path(params[:task_list_id])
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :status, :notes, :start_date,
                                   :due_date)
    end

end
