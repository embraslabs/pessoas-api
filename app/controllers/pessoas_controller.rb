class PessoasController < ApplicationController

  # /pessoas
  def index
    # Desafio 2
    # Primeiro corrigir este método
    # para buscar informações do banco de dados
    @pessoas = Person.all

    ## Desafio 6
    ## localhost:3010/pessoas?filtro=jo
    ## Receber um parametro 'filtro' e filtrar pelo nome do usuário
    ## usar função where com SQL ilike
  end

  # GET /pessoas/:id
  def show
    # Desafio 3
    # Exibir detalhes de apenas um usuário
    @pessoa = Person.find_by(id: params[:id])
    unless @pessoa
      render json: { error: "Pessoa não encontrada" }, status: 422
    end
  end

  # PATCH /pessoas/:id
  def update
    # Desafio 4
    # Atualizar a pessoa informada na URL
    @pessoa = Person.find_by(id: params[:id])
    render json: { error: "Pessoa não encontrada" }, status: 422 unless @pessoa
    
    @pessoa.attributes = person_params
    if pessoa.save
      render json: { id: pessoa.id }
    else
      render json: { errors: pessoa.errors }, status: 422
    end
  end

  # DELETE /pessoas/:id
  def destroy
    # Desafio 5
    # Deletar a pessoa informada na URL
    @pessoa = Person.find_by(id: params[:id])
    render json: { error: "Pessoa não encontrada" }, status: 422 unless @pessoa

    if @pessoa.destroy
      head :ok
    else
      render json: { error: "Não foi possível excluir o registro" }
    end
  end

  def create
    pessoa = Person.new(person_params)
    if pessoa.save
      render json: { id: pessoa.id }, status: 201
    else
      render json: { errors: pessoa.errors }, status: 422
    end
  end

  private

  def person_params
    params.permit(:name, :email)
  end

end