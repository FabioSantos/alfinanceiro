# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110318022650) do

  create_table "core_servidors", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     :default => false
    t.string   "nome"
    t.string   "cpf"
    t.integer  "matricula"
    t.string   "identidade"
    t.string   "pis_pasep"
  end

  add_index "core_servidors", ["cpf"], :name => "index_core_servidors_on_cpf"
  add_index "core_servidors", ["identidade"], :name => "index_core_servidors_on_identidade"
  add_index "core_servidors", ["matricula"], :name => "index_core_servidors_on_matricula"
  add_index "core_servidors", ["nome"], :name => "index_core_servidors_on_nome"
  add_index "core_servidors", ["pis_pasep"], :name => "index_core_servidors_on_pis_pasep"
  add_index "core_servidors", ["status"], :name => "index_core_servidors_on_status"

  create_table "core_usuarios", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",     :default => false
    t.string   "nome"
    t.string   "cpf"
    t.integer  "matricula"
    t.string   "senha"
    t.boolean  "admin",      :default => false
    t.boolean  "su",         :default => false
  end

  add_index "core_usuarios", ["cpf"], :name => "index_core_usuarios_on_cpf"
  add_index "core_usuarios", ["matricula"], :name => "index_core_usuarios_on_matricula"
  add_index "core_usuarios", ["nome"], :name => "index_core_usuarios_on_nome"
  add_index "core_usuarios", ["senha"], :name => "index_core_usuarios_on_senha"
  add_index "core_usuarios", ["status"], :name => "index_core_usuarios_on_status"

end
