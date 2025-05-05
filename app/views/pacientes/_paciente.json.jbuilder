json.extract! paciente, :id, :nome, :idade, :cliente_id, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
