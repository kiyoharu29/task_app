class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @task.save
      flash[:notice] = "スケジュールを登録しました。"
      redirect_to :tasks
    else
      flash[:alert] = "スケジュールを登録できませんでした。"
      render :new
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task = Task.update(params.require(:task).permit(:title, :start_day, :end_day, :all_day))
      flash[:notice] = "スケジュールを編集しました。"
      redirect_to :tasls
    else
      render :edit_task
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました。"
    redirect_to :tasks
  end
end
