class Cliente < ApplicationRecord
  belongs_to :empresa
  belongs_to :profissional
  has_many :pacientes
end
