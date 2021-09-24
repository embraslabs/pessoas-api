class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find_by(id: params[:id])
    render json: { errors: 'Pessoa não encontrada'}, status: 404 unless @person
  end

  def create
    person = Person.new(person_params)
    if person.save
      render json: {}, status: 201
    else
      render json: { errors: person.errors }, status: 422
    end
  end

  def update
    person = Person.find_by(id: params[:id])
    person.attributes = person_params
    if person.save
      render json: {}
    else
      render json: { errors: person.errors }, status: 422
    end
  end

  def destroy
    person = Person.find_by(id: params[:id])
    if person && person.destroy
      render json: {}
    else
      if person
        render json: { errors: person.errors }, status: 422
      else
        render json: { errors: 'Pessoa não encontrada' }, status: 404
      end
    end
  end

  def person_params
    params.permit(:name, :email)
  end

end