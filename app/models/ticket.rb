class Ticket < ApplicationRecord
  belongs_to :person
  enum status: { aberto: 0, analise: 1, finalizado: 2 }
end