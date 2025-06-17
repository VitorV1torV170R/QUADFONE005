class Empresa < ApplicationRecord
    has_many :profissionals
    belongs_to :atendimento
    belongs_to :paciente
    has_many :clientes
end
