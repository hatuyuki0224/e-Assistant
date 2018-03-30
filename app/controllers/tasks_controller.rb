class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @tasks.order(:task_name)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.task_user = @current_user.id

    current_time = Time.current
    dead_line = @task.deadline

    spares = [[current_time, dead_line]]

    events_selected = current_user.events.where("start <= ? and end >= ?", dead_line, current_time).order(:start)

    for event in events_selected do
      if event.start <= current_time && event.end >= dead_line then
        spares.pop
      elsif event.start <= current_time then
        spares.first[0] = event.end
      elsif event.end >= dead_line then
        spares.last[1] = event.start
      else
        spares.push([event.end, spares.last[1]])
        spares[-2][1] = event.start
      end
    end

    for spare in spares do
      if (spare[1] - spare[0]) >= @task.required_time*60 then
        current_user.events.create([title: @task.task_name, start: spare[0], end: spare[0]+@task.required_time*60])
        break
      end
    end
      
    respond_to do |format|
      if @task.save
        flash[:notice] = "新しいタスクを追加しました"
        format.html { redirect_to @task}
        format.json { render :show, status: :created, location: @task }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        flash[:notice] = "タスクを編集しました"
        format.html { redirect_to @task }
        format.json { render :show, status: :ok, location: @task }
        format.js
        redirect_to("/tasks")
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      flash[:notice] = "タスクを削除しました"
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task_name, :deadline, :required_time, :priority, :color, :comment)
    end
end
