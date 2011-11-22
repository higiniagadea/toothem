class CreateConsultorios < ActiveRecord::Migration
  def self.up
    create_table "consultorios" do |t|
      t.column :nombre, :string
      t.column :clinica_id, :integer
      t.column :deleted_at, :date
    end

    #Join table (Usuarios)
    create_table "usuarios_consultorios" do |t|
      t.column :usuario_id, :integer
      t.column :consultorio_id, :integer
    end

    add_index "usuarios_consultorios", "usuario_id"
    add_index "usuarios_consultorios", "consultorio_id"



  end


  def self.down
    drop_table "consultorios"
    drop_table "usuarios_consultorios"
  end
end
