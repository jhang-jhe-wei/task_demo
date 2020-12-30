class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :login?

  def login?
    @current_user = User.find_by id: session[:current_user_id]
    redirect_to login_path unless @current_user
  end

  def search
    puts params[:tag]
    @tasks = @current_user.tasks.where("title = ?", params[:title]).includes(:user).page(params[:page]) if params[:title]
    @tasks = @current_user.tasks.where("state = ?", Task.states[params[:state]]).includes(:user).page(params[:page]) if params[:state]
    @tasks = Tag.find_by(name: params[:tag]).tasks.where(user: @current_user).includes(:user).page(params[:page]) if params[:tag] && params[:tag] != ""
    @tasks ||= Task.where(title: nil).includes(:user).page(params[:page])
    render :index
  end

  # GET /tasks
  # GET /tasks.json
  def index
    case params[:type]
    when "end_time"
      @tasks = @current_user.tasks.order("end_time").includes(:user).page(params[:page])
    when "piority"
      @tasks = @current_user.tasks.order("piority").includes(:user).page(params[:page])
    else
      @tasks = @current_user.tasks.order("created_at").includes(:user).page(params[:page])
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
    params[:task][:tag].split(" ").each do |tag|
      unless tag == ""
        puts "in create tag"
        @task.tags << (Tag.find_by(name: tag) || Tag.create(name: tag))
      end
    end
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
        @task.tags.destroy_all
        params[:task][:tag].split(" ").each do |tag|
          unless tag == ""
            puts "in create tag"
            @task.tags << (Tag.find_by(name: tag) || Tag.create(name: tag))
          end
        end
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
      format.html { unless @current_user.admin then redirect_to tasks_url, notice: I18n.t("d_task_happy") else redirect_to admin_users_path, notice: I18n.t("d_task_happy") end }
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
    task = Task.find params[:id]
    params[:task][:user_id] = task.user || @current_user.id
    params.require(:task).permit(:name, :title, :content, :user_id, :start_time, :end_time, :piority, :state)
  end
end
