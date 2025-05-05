json.extract! empresa, :id, :nome, :cnpj, :endereco, :telefone, :email, :profissional_id, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
