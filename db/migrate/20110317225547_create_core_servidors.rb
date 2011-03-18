class CreateCoreServidors < ActiveRecord::Migration
  def self.up
    create_table :core_servidors do |t|
      t.timestamps
      t.boolean :status, :default=>false
      t.string  :nome, nil=>false
      t.string  :cpf, nil=>false
      t.integer :matricula, nil=>false
      t.string  :identidade, nil=>false
      t.string  :pis_pasep, nil=>false
    end

    add_index :core_servidors, :status
    add_index :core_servidors, :nome
    add_index :core_servidors, :cpf
    add_index :core_servidors, :matricula
    add_index :core_servidors, :identidade
    add_index :core_servidors, :pis_pasep
  end

  def self.down
    drop_table :core_servidors
  end
end

