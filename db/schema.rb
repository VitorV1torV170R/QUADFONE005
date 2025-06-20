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

ActiveRecord::Schema[8.0].define(version: 2025_06_20_133404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "atendimentopalavras", force: :cascade do |t|
    t.string "palavra"
    t.string "transcricao"
    t.integer "atendimento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atendimento_id"], name: "index_atendimentopalavras_on_atendimento_id"
  end

  create_table "atendimentos", force: :cascade do |t|
    t.datetime "data"
    t.text "descricao"
    t.string "status"
    t.integer "paciente_id", null: false
    t.integer "profissional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vocabulario_id"
    t.integer "cliente_id"
    t.index ["paciente_id"], name: "index_atendimentos_on_paciente_id"
    t.index ["profissional_id"], name: "index_atendimentos_on_profissional_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profissional_id"
    t.integer "empresa_id"
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
    t.integer "empresa_id"
    t.index ["cliente_id"], name: "index_pacientes_on_cliente_id"
  end

  create_table "profissionals", force: :cascade do |t|
    t.string "nome"
    t.string "endereço"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "empresa_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.string "email"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "atendimentopalavras", "atendimentos"
  add_foreign_key "atendimentos", "pacientes"
  add_foreign_key "atendimentos", "profissionals"
  add_foreign_key "empresas", "profissionals"
  add_foreign_key "pacientes", "clientes"
  add_foreign_key "sessions", "users"
  add_foreign_key "vocabulariopalavras", "vocabularios"
end
