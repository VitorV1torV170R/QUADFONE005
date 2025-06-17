class AddClienteIdToAtendimentos < ActiveRecord::Migration[8.0]
  def change
    add_column :atendimentos, :cliente_id, :integer
  end
end
