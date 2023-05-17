class PeopleInTeamsController < ApplicationController
  before_action :set_people_in_team, only: %i[ show edit update destroy ]

  # GET /people_in_teams or /people_in_teams.json
  def index
    @people_in_teams = PeopleInTeam.all
  end

  # GET /people_in_teams/1 or /people_in_teams/1.json
  def show
    @people_in_teams = PeopleInTeam.find(params[:id])
  end

  # GET /people_in_teams/new
  def new
    @people_in_team = PeopleInTeam.new
  end

  # GET /people_in_teams/1/edit
  def edit
    @people_in_teams = PeopleInTeam.find(params[:id])
  end

  # POST /people_in_teams or /people_in_teams.json
  def create
    @people_in_team = PeopleInTeam.new(people_in_team_params)

    respond_to do |format|
      if @people_in_team.save
        format.html { redirect_to people_in_team_url(@people_in_team), notice: "Person in team was successfully created." }
        format.json { render :show, status: :created, location: @people_in_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @people_in_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people_in_teams/1 or /people_in_teams/1.json
  def update
    respond_to do |format|
      if @people_in_team.update(people_in_team_params)
        format.html { redirect_to people_in_team_url(@people_in_team), notice: "Person in team was successfully updated." }
        format.json { render :show, status: :ok, location: @people_in_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @people_in_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_in_teams/1 or /people_in_teams/1.json
  def destroy
    @people_in_team.destroy

    respond_to do |format|
      format.html { redirect_to people_in_teams_url, notice: "Person in team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_in_team
      @people_in_team = PeopleInTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def people_in_team_params
      params.require(:people_in_team).permit(:team_id,:people_id)
    end
end
