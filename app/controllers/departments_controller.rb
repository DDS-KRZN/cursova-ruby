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
    @department = @company.departments.find()
  end

  private
  def department_params
    params.require(:department).permit(:name)
  end

end
