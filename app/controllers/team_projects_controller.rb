class TeamProjectsController < ApplicationController
  before_action :set_team_project, only: %i[ show edit update destroy ]

  # GET /team_projects or /team_projects.json
  def index
    @team_projects = TeamProject.all
  end

  # GET /team_projects/1 or /team_projects/1.json
  def show
    @team_project=TeamProject.find(params[:id])
  end

  # GET /team_projects/new
  def new
    @team_project = TeamProject.new
  end

  # GET /team_projects/1/edit
  def edit
    @team_project=TeamProject.find(params[:id])
  end

  # POST /team_projects or /team_projects.json
  def create
    puts "Params: #{params.inspect}"
    @team_project = TeamProject.new(team_project_params)

    respond_to do |format|
      if @team_project.save
        format.html { redirect_to team_project_url(@team_project), notice: "Team project was successfully created." }
        format.json { render :show, status: :created, location: @team_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_projects/1 or /team_projects/1.json
  def update
    respond_to do |format|
      if @team_project.update(team_project_params)
        format.html { redirect_to team_project_url(@team_project), notice: "Team project was successfully updated." }
        format.json { render :show, status: :ok, location: @team_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_projects/1 or /team_projects/1.json
  def destroy
    @team_project.destroy

    respond_to do |format|
      format.html { redirect_to team_projects_url, notice: "Team project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team_project
    @team_project = TeamProject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_project_params
    params.require(:team_project).permit(:team_id,:project_id)
  end
end
