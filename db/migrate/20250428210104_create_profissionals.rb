class CreateProfissionals < ActiveRecord::Migration[8.0]
  def change
    create_table :profissionals do |t|
      t.string :nome
      t.string :endereço
      t.string :telefone
      t.string :email

      t.timestamps
    end
  end
end
