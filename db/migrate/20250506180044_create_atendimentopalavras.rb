class CreateAtendimentopalavras < ActiveRecord::Migration[8.0]
  def change
    create_table :atendimentopalavras do |t|
      t.string :palavra
      t.string :transcricao
      t.references :atendimento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
