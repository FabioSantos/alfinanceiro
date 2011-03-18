class CreateCoreUsuarios < ActiveRecord::Migration
  def self.up
    create_table :core_usuarios do |t|
      t.timestamps
      t.boolean :status, :default=>false
      t.string  :nome, nil=>false
      t.string  :cpf, nil=>false
      t.integer :matricula, nil=>false
      t.string  :senha, nil=>false
      t.boolean :admin, :default=>false
      t.boolean :su, :default=>false
    end

    add_index :core_usuarios, :status
    add_index :core_usuarios, :nome
    add_index :core_usuarios, :cpf
    add_index :core_usuarios, :matricula
    add_index :core_usuarios, :senha
  end

  def self.down
    drop_table :core_usuarios
  end
end

