class Atendimento < ApplicationRecord
  belongs_to :paciente
  belongs_to :profissional
end
