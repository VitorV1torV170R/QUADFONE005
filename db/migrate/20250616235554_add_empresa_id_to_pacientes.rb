class AddEmpresaIdToPacientes < ActiveRecord::Migration[8.0]
  def change
    add_column :pacientes, :empresa_id, :integer
  end
end
