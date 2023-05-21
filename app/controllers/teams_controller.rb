class TeamsController < ApplicationController
   before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
   def index
     @company = Company.find(params[:company_id])
     @department = Department.find(params[:department_id])
     @teams = @department.teams
   end

  # GET /teams/1 or /teams/1.json
  def show
    @team = Team.find(params[:id])
  end

  # GET /teams/new
   def new
     @company = Company.find(params[:company_id])
     @department = @company.departments.find(params[:department_id])
     @team = Team.new
   end

  # GET /teams/1/edit
   def edit
     @team = Team.find(params[:id])
     @department = @team.department
     @company = @department.company
   end


  # POST /teams or /teams.json
   def create
     Rails.logger.debug "Starting create method"
     @department = Department.find(params[:company_id])
     @team = @department.teams.new(team_params)
     # @team = Team.new(team_params)
     # @team.department_id = params[:department_id]

     if @team.save
       Rails.logger.debug "if @team.save"
       # ...
     else
       Rails.logger.debug "else"
       render :new
     end
   end



  # PATCH/PUT /teams/1 or /teams/1.json
   def update
     @department = @team.department
     @company = @department.company

     respond_to do |format|
       if @team.update(team_params)
         format.html { redirect_to company_department_team_url(@company, @department, @team), notice: "Team was successfully updated." }
         format.json { render :show, status: :ok, location: @team }
       else
         format.html { render :edit, status: :unprocessable_entity }
         format.json { render json: @team.errors, status: :unprocessable_entity }
       end
     end
   end



  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
   def team_params
     params.require(:team).permit(:name, :department_id)
   end
end

  

