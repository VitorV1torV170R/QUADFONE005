class AddEmpresaIdToProfissionals < ActiveRecord::Migration[8.0]
  def change
    add_column :profissionals, :empresa_id, :integer
  end
end
