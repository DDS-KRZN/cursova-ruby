class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  def index
    @people = Person.all
  end

  def show
    @people = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @people = Person.find(params[:id])
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_url(@person), notice: "Person in team was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @person = Person.new(person_params)
    logger.debug "Person params: #{person_params.inspect}"
    respond_to do |format|
      if @person.save
        format.html { redirect_to people_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
  def set_person
    @person = Person.find(params[:id])
  end
  def person_params
    params.require(:person).permit(:name, :email, :phone)
  end
end
