class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def search
    #puts I18n.t(params[:state])
    @tasks = Task.where("title = ?", params[:title]).includes(:user).page(params[:page]) if params[:title]
    @tasks = Task.where("state = ?", Task.states[params[:state]]).includes(:user).page(params[:page]) if params[:state]
    @tasks ||= Task.all
    render :index
  end

  # GET /tasks
  # GET /tasks.json
  def index
    case params[:type]
    when "end_time"
      @tasks = Task.order("end_time").includes(:user).page(params[:page])
    when "piority"
      @tasks = Task.order("piority").includes(:user).page(params[:page])
    else
      @tasks = Task.order("created_at").includes(:user).page(params[:page])
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: I18n.t("c_task_happy") }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: I18n.t("u_task_happy") }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: I18n.t("d_task_happy") }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    #puts params
    params.require(:task).permit(:name, :title, :content, :tag, :user_id, :start_time, :end_time, :piority, :state)
  end
end
