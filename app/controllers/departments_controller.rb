class DepartmentsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @departments = @company.departments
  end

  def new
    @company = Company.find(params[:company_id])
    @department = @company.departments.new

  end

  def create
    @company = Company.find_by(id: params[:company_id])
    @director = Person.find_by(id: params[:department][:director_id])
    if @director.nil?
      flash[:error] = "Invalid director ID"
      render :new and return
    end
    @department = @company.departments.new(department_params)
    @department.director = @director
    if @department.save
      redirect_to company_departments_path(@company.id)
    else
      render :new
    end

  end

  def edit
    @company = Company.find(params[:company_id])
    @department = @company.departments.find(params[:id])
    @director = Person.find_by(id: params[:department][:director_id])
  end

  private
  def department_params
    params.require(:department).permit(:name, :director_id)
  end

end
