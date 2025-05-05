class CreateAtendimentos < ActiveRecord::Migration[8.0]
  def change
    create_table :atendimentos do |t|
      t.datetime :data
      t.text :descricao
      t.string :status
      t.references :paciente, null: false, foreign_key: true
      t.references :profissional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
