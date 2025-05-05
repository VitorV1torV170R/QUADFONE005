class CreateVocabulariopalavras < ActiveRecord::Migration[8.0]
  def change
    create_table :vocabulariopalavras do |t|
      t.string :palavra
      t.references :vocabulario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
