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
    @company = Company.find(params[:company_id])
    @department = @company.departments.new(department_params)
    if @department.save
      redirect_to company_departments_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @department = @company.departments.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @department = @company.departments.find(params[:id])
    if @department.update(department_params)
      redirect_to company_department_path(@company, @department)
    else
      render :edit
    end
  end



  def show
    @company = Company.find(params[:company_id])
    @department = @company.departments.find(params[:id])
  end

  private
  def department_params
    params.require(:department).permit(:name, :director_id)
  end

end
