json.extract! atendimento, :id, :data, :descricao, :status, :paciente_id, :profissional_id, :created_at, :updated_at
json.url atendimento_url(atendimento, format: :json)
