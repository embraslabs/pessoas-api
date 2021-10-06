# app/services/filtrar_pessoas.rb
class FiltrarPessoas

  attr_reader :people

  def initialize(params)
    @people = Person.all
    filter_by_name(params[:name]) if params[:name].present?
  end

  private

  def filter_by_name(name)
    @people = @people.where('name ILIKE ?', "%#{name}%")
  end

end