class CreateEmpresas < ActiveRecord::Migration[8.0]
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :cnpj
      t.string :endereco
      t.string :telefone
      t.string :email
      t.references :profissional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
