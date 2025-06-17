class AddProfissionalIdToClientes < ActiveRecord::Migration[8.0]
  def change
    add_column :clientes, :profissional_id, :integer
  end
end
