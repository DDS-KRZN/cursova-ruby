class DepartmentsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @departments = @company.departments
  end

  def show
    @department = Department.find(params[:id])

    @company = @department.company
  end
  def new
    @company = Company.find(params[:company_id])
    @department = @company.departments.new
  end

  def create
    @company = Company.find(params[:company_id])
    @department = @company.departments.build(department_params)
    @director = Person.find_by(id: params[:department][:director_id])
    @department.person_id = params[:department][:director_id]


    if @department.save
      redirect_to company_departments_path(@company)
    else
      puts @department.errors.full_messages # отладочный вывод

      render :new
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_path
  end
  def edit
    @company = Company.find(params[:company_id])
    @department = @company.departments.find(params[:id])
  end

  private
  def department_params
    params.require(:department).permit(:name, :director_id)
  end

end
