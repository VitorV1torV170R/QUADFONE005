class Profissional < ApplicationRecord
    
    belongs_to :empresa
    has_many :atendimento
    has_many :clientes
    has_many :paciente
end
