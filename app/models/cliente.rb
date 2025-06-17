class Cliente < ApplicationRecord
    has_many :pacientes
    belongs_to :profissional
    belongs_to :empresa
end
