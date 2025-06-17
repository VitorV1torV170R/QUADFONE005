class Profissional < ApplicationRecord
    belongs_to :atendimento
    belongs_to :paciente
    belongs_to :empresa
    has_many :clientes
end
