class AddVocabularioIdToAtendimentos < ActiveRecord::Migration[8.0]
  def change
    add_column :atendimentos, :vocabulario_id, :integer
  end
end
