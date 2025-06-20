class Empresa < ApplicationRecord
    has_many :profissionals
    has_many :atendimento
    has_many :clientes
    has_many :paciente
end
