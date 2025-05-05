class CreateVocabularios < ActiveRecord::Migration[8.0]
  def change
    create_table :vocabularios do |t|
      t.string :nome

      t.timestamps
    end
  end
end
