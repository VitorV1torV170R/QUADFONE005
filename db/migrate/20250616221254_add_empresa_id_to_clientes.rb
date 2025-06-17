class AddEmpresaIdToClientes < ActiveRecord::Migration[8.0]
  def change
    add_column :clientes, :empresa_id, :integer
  end
end
