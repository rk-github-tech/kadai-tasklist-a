class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = '正常に作成されました'
      redirect_to task_path(@task)
    else
      flash.now[:danger] = '作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update

    if @task.save
      flash[:success] = '正常に更新されました'
      redirect_to task_url(@task)
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @task.destroy
  
    flash[:success] = '正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
