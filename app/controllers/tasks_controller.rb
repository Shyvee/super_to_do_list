class TasksController < ApplicationController
  before_action :check_if_owner, only: [:show, :edit, :update, :destroy]

  def check_if_owner
    task = Task.find(params[:id])
    if task.user_id != current_user.id
        redirect_to "/tasks", notice: "Please create your own tasks!"
    end
  end


  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.due_date = Chronic.parse(params[:due_date])
    @task.task_name = params[:task_name]
    @task.user_id = current_user.id
    @task.notes = params[:notes]
    @task.high_priority = params[:high_priority]
    @task.category_id = params[:category_id]


    if @task.save
      redirect_to "/tasks", :notice => "Task created successfully."
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.due_date = Chronic.parse(params[:due_date])
    @task.task_name = params[:task_name]
    @task.due_time = params[:due_time]
    @task.complete = params[:complete]
    @task.row_order = params[:row_order]
    @task.notes = params[:notes]
    @task.high_priority = params[:high_priority]
    @task.category_id = params[:category_id]

    if @task.save
      redirect_to "/tasks", :notice => "Task updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to "/tasks", :notice => "Task deleted."
  end
end
