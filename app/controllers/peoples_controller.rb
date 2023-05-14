class PeoplesController < ApplicationController
  def index
    @people = People.all
  end

  def show
    @people = People.find(params[:id])
  end

  def new
    @people = People.new
  end

  def create
    @people = People.new(people_params)

    if @people.save
      redirect_to people_path(@people), notice: 'People was successfully created.'
    else
      render :new
    end
  end

  def edit
    @people = People.find(params[:id])
  end

  def update
    @people = People.find(params[:id])

    if @people.update(people_params)
      redirect_to @people, notice: 'People was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @people = People.find(params[:id])
    @people.destroy
    redirect_to peoples_url, notice: 'People was successfully destroyed.'
  end

  private

  def people_params
    params.require(:people).permit(:name, :email, :phone)
  end
end
