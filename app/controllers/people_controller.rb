class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path(@person), notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to person_url(@person), notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to people_path, notice: 'Person was successfully deleted.'

  end

  private
  def set_person
    @person = Person.find(params[:id])
  end
  def person_params
    params.require(:person).permit(:name, :email, :phone)
  end
end