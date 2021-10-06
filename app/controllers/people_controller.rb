class PeopleController < ApplicationController

  before_action :load_person, only: [:show, :update, :destroy]
  # Index, Show, New, Create, Edit, Update, Destroy

  def index
    filter = FiltrarPessoas.new(search_params)
    @people = filter.people
  end

  def show
    render json: { errors: 'Pessoa não encontrada'}, status: 404 unless @person
  end

  def create
    person = Person.new(person_params)
    if person.save
      render json: {id: person.id}, status: 201
    else
      render json: { errors: person.errors }, status: 422
    end
  end

  def update
    @person.attributes = person_params
    if @person.save
      render json: {id: @person.id}
    else
      render json: { errors: @person.errors }, status: 422
    end
  end

  def destroy
    if @person && @person.destroy
      render json: {}
    else
      if @person
        render json: { errors: @person.errors }, status: 422
      else
        render json: { errors: 'Pessoa não encontrada' }, status: 404
      end
    end
  end

  private

  def load_person
    @person = Person.find_by(id: params[:id])
  end

  def person_params
    params.permit(:name, :email)
  end

  def search_params
    params.permit(:name)
  end

end
