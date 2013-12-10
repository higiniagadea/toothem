class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table "usuarios", :force => true do |t|
      t.string :login,                      :limit => 40
      t.string :name,                       :limit => 100
      t.string :email,                      :limit => 100
      t.string :crypted_password,           :limit => 40
      t.string :salt,                       :limit => 40
      t.string :created_at
      t.string :updated_at
      t.string :remember_token,             :limit => 40
      t.string :remember_token_expires_at
      t.string :nombre_apellido,            :limit => 100
      t.integer :perfil_id
      t.integer :consultorio_id
      t.boolean :administrador, :default => false

    end
    add_index :usuarios, :login, :unique => true
  end

  def self.down
    drop_table "usuarios"
  end
end
