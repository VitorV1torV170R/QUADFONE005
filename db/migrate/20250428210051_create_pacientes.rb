class CreatePacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.integer :idade
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
