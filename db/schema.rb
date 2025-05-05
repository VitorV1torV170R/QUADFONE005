# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_28_210134) do
  create_table "atendimentopalavras", force: :cascade do |t|
    t.string "palavra"
    t.string "transcricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atendimentos", force: :cascade do |t|
    t.datetime "data"
    t.text "descricao"
    t.string "status"
    t.integer "paciente_id", null: false
    t.integer "profissional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_atendimentos_on_paciente_id"
    t.index ["profissional_id"], name: "index_atendimentos_on_profissional_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.integer "profissional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profissional_id"], name: "index_empresas_on_profissional_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.integer "idade"
    t.integer "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pacientes_on_cliente_id"
  end

  create_table "profissionals", force: :cascade do |t|
    t.string "nome"
    t.string "endereço"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vocabulariopalavras", force: :cascade do |t|
    t.string "palavra"
    t.integer "vocabulario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vocabulario_id"], name: "index_vocabulariopalavras_on_vocabulario_id"
  end

  create_table "vocabularios", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "atendimentos", "pacientes"
  add_foreign_key "atendimentos", "profissionals"
  add_foreign_key "empresas", "profissionals"
  add_foreign_key "pacientes", "clientes"
  add_foreign_key "vocabulariopalavras", "vocabularios"
end
