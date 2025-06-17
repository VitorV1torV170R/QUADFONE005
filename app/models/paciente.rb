class Paciente < ApplicationRecord
  belongs_to :cliente
  belongs_to :empresa
  has_many :atendimentos
end
