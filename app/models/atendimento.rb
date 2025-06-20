class Atendimento < ApplicationRecord
  belongs_to :paciente
  belongs_to :cliente
  belongs_to :profissional
  belongs_to :empresa
  belongs_to :vocabulario, optional: true
  has_one_attached :audio
  has_one_attached :image 
end